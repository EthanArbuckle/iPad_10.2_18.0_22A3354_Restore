@implementation CKCBCorecryptoECPoint

+ (unint64_t)groupOrderByteCountForCP:(ccec_cp *)a3
{
  return (unint64_t)(cczp_bitlen() + 7) >> 3;
}

- (unint64_t)pointAllocationSizeForGroup:(ccec_cp *)a3
{
  return 3 * ((unint64_t)(cczp_bitlen() + 7) >> 3);
}

- (id)initPoint:(ccec_affine_point *)a3 onGroup:(ccec_cp *)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKCBCorecryptoECPoint;
  result = -[CKCBCorecryptoECPoint init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a4;
    *((_QWORD *)result + 2) = a3;
  }
  return result;
}

- (id)initFromPublicKeyBytes:(id)a3 inGroup:(ccec_cp *)a4 compressed:(BOOL)a5 corecryptoError:(int *)a6
{
  _BOOL4 v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char *v14;
  id v15;
  int v16;
  CKCBCorecryptoECPoint *v17;
  CKCBCorecryptoECPoint *v18;
  _QWORD v20[2];

  v7 = a5;
  v20[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v12 = (void *)MEMORY[0x1E0C80A78](v9, v10, v11);
  v14 = (char *)v20 - v13;
  objc_msgSend(v12, "length");
  v15 = objc_retainAutorelease(v9);
  objc_msgSend(v15, "bytes");
  if (v7)
    v16 = ccec_compressed_x962_import_pub();
  else
    v16 = ccec_raw_import_pub();
  *a6 = v16;
  if (v16)
  {
    cc_clear();
    v17 = 0;
  }
  else
  {
    v18 = -[CKCBCorecryptoECPoint initWithPublicKey:](self, "initWithPublicKey:", v14);
    cc_clear();
    self = v18;
    v17 = self;
  }

  return v17;
}

- (CKCBCorecryptoECPoint)initWithGeneratorForCP:(ccec_cp *)a3
{
  size_t v5;
  void *v6;
  char *v7;

  v5 = -[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:");
  v6 = malloc_type_malloc(v5, 0xA1D9AA7CuLL);
  v7 = (char *)&a3[1] + 16 * a3->var0 + 8 * a3->var0;
  bzero(v6, v5);
  memcpy(v6, v7, 16 * a3->var0);
  return (CKCBCorecryptoECPoint *)-[CKCBCorecryptoECPoint initPoint:onGroup:](self, "initPoint:onGroup:", v6, a3);
}

- (CKCBCorecryptoECPoint)initWithPublicKey:(ccec_pub_ctx *)a3
{
  ccec_projective_point *v4;
  ccec_cp *var0;
  size_t v6;
  void *v7;

  v4 = &a3->var1[1];
  var0 = a3->var0;
  v6 = -[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", a3->var0);
  v7 = malloc_type_malloc(v6, 0x16B7CB37uLL);
  memcpy(v7, v4, v6);
  cc_clear();
  return (CKCBCorecryptoECPoint *)-[CKCBCorecryptoECPoint initPoint:onGroup:](self, "initPoint:onGroup:", v7, var0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ccec_cp *v5;
  BOOL v6;

  v4 = a3;
  v5 = -[CKCBCorecryptoECPoint group](self, "group");
  if (v5 == (ccec_cp *)objc_msgSend(v4, "group"))
  {
    -[CKCBCorecryptoECPoint group](self, "group");
    -[CKCBCorecryptoECPoint point](self, "point");
    objc_msgSend(v4, "point");
    v6 = ccn_cmp() == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)serializedPublicKey:(BOOL)a3
{
  ccec_cp *group;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  group = self->_group;
  v6 = cczp_bitlen();
  v9 = (unint64_t)(v6 + 7) >> 3;
  if (a3)
  {
    MEMORY[0x1E0C80A78](v6, v7, v8);
    *(_QWORD *)((char *)v17 - v10) = group;
    memcpy((char *)&v17[2] - v10, self->_point, 2 * v9);
    v11 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", ccec_compressed_x962_export_pub_size()));
    objc_msgSend(v11, "mutableBytes");
    v12 = ccec_compressed_x962_export_pub();
    cc_clear();
    if (v12)
      v13 = 0;
    else
      v13 = v11;

    return v13;
  }
  else
  {
    v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2 * v9));
    objc_msgSend(v14, "mutableBytes");
    ccn_write_uint_padded_ct();
    v15 = objc_retainAutorelease(v14);
    objc_msgSend(v15, "mutableBytes");
    ccn_write_uint_padded_ct();
    return v15;
  }
}

+ (unint64_t)compressedx962PointByteCountForCurveParameters:(ccec_cp *)a3
{
  return ccec_compressed_x962_export_pub_size();
}

- (id)add:(id)a3 corecryptoError:(int *)a4
{
  id v6;
  ccec_cp *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  ccec_cp *group;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;

  v6 = a3;
  v7 = -[CKCBCorecryptoECPoint group](self, "group");
  if (v7 == (ccec_cp *)objc_msgSend(v6, "group"))
  {
    v8 = ccrng();
    if (!*a4)
    {
      group = self->_group;
      v14 = MEMORY[0x1E0C80A78](v8, v9, v10);
      MEMORY[0x1E0C80A78](v14, v15, v16);
      -[CKCBCorecryptoECPoint point](self, "point");
      v17 = ccec_projectify();
      *a4 = v17;
      if (v17 || (objc_msgSend(v6, "point"), v18 = ccec_projectify(), (*a4 = v18) != 0))
      {
        cc_clear();
      }
      else
      {
        *a4 = ccec_full_add();
        cc_clear();
        if (!*a4)
        {
          v19 = malloc_type_malloc(-[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", group), 0x4349E20AuLL);
          *a4 = ccec_affinify();
          cc_clear();
          if (!*a4)
          {
            v11 = -[CKCBCorecryptoECPoint initPoint:onGroup:]([CKCBCorecryptoECPoint alloc], "initPoint:onGroup:", v19, group);
            goto LABEL_4;
          }
          free(v19);
          goto LABEL_9;
        }
      }
      cc_clear();
LABEL_9:
      v11 = 0;
      goto LABEL_4;
    }
  }
  v11 = 0;
LABEL_4:

  return v11;
}

- (id)sub:(id)a3 corecryptoError:(int *)a4
{
  id v6;
  ccec_cp *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  ccec_cp *group;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;

  v6 = a3;
  v7 = -[CKCBCorecryptoECPoint group](self, "group");
  if (v7 == (ccec_cp *)objc_msgSend(v6, "group"))
  {
    v8 = ccrng();
    if (!*a4)
    {
      group = self->_group;
      v14 = MEMORY[0x1E0C80A78](v8, v9, v10);
      MEMORY[0x1E0C80A78](v14, v15, v16);
      -[CKCBCorecryptoECPoint point](self, "point");
      v17 = ccec_projectify();
      *a4 = v17;
      if (v17 || (objc_msgSend(v6, "point"), v18 = ccec_projectify(), (*a4 = v18) != 0))
      {
        cc_clear();
      }
      else
      {
        *a4 = ccec_full_sub();
        cc_clear();
        if (!*a4)
        {
          v19 = malloc_type_malloc(-[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", group), 0x173E04EuLL);
          *a4 = ccec_affinify();
          cc_clear();
          if (!*a4)
          {
            v11 = -[CKCBCorecryptoECPoint initPoint:onGroup:]([CKCBCorecryptoECPoint alloc], "initPoint:onGroup:", v19, group);
            goto LABEL_4;
          }
          free(v19);
          goto LABEL_9;
        }
      }
      cc_clear();
LABEL_9:
      v11 = 0;
      goto LABEL_4;
    }
  }
  v11 = 0;
LABEL_4:

  return v11;
}

- (id)multiply:(id)a3 corecryptoError:(int *)a4
{
  id v6;
  ccec_cp *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  ccec_cp *group;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;

  v6 = a3;
  v7 = -[CKCBCorecryptoECPoint group](self, "group");
  if (v7 == (ccec_cp *)objc_msgSend(v6, "group"))
  {
    v8 = ccrng();
    if (!*a4)
    {
      group = self->_group;
      v14 = MEMORY[0x1E0C80A78](v8, v9, v10);
      MEMORY[0x1E0C80A78](v14, v15, v16);
      -[CKCBCorecryptoECPoint point](self, "point");
      v17 = ccec_projectify();
      *a4 = v17;
      if (v17)
      {
        cc_clear();
      }
      else
      {
        objc_msgSend(v6, "corecryptoScalar");
        *a4 = ccec_mult_blinded();
        cc_clear();
        if (!*a4)
        {
          v18 = malloc_type_malloc(-[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", group), 0xFA8B0956uLL);
          *a4 = ccec_affinify();
          cc_clear();
          if (!*a4)
          {
            v11 = -[CKCBCorecryptoECPoint initPoint:onGroup:]([CKCBCorecryptoECPoint alloc], "initPoint:onGroup:", v18, group);
            goto LABEL_4;
          }
          free(v18);
          goto LABEL_9;
        }
      }
      cc_clear();
LABEL_9:
      v11 = 0;
      goto LABEL_4;
    }
  }
  v11 = 0;
LABEL_4:

  return v11;
}

- (void)dealloc
{
  rsize_t v3;
  objc_super v4;

  if (self->_point)
  {
    v3 = -[CKCBCorecryptoECPoint pointAllocationSizeForGroup:](self, "pointAllocationSizeForGroup:", -[CKCBCorecryptoECPoint group](self, "group"));
    memset_s(self->_point, v3, 0, v3);
    free(self->_point);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKCBCorecryptoECPoint;
  -[CKCBCorecryptoECPoint dealloc](&v4, sel_dealloc);
}

- (ccec_cp)group
{
  return self->_group;
}

- (ccec_affine_point)point
{
  return self->_point;
}

@end
