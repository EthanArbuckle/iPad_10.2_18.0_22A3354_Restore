@implementation CKCBCorecryptoECScalar

- (unint64_t)scalarAllocationSizeForGroup:(ccec_cp *)a3
{
  return 8 * a3->var0;
}

- (CKCBCorecryptoECScalar)initWithx963Representation:(id)a3 group:(ccec_cp *)a4
{
  CKCBCorecryptoECScalar *v5;
  uint64_t v6;
  _QWORD **v7;
  id v8;
  id v9;
  id v10;
  CKCBCorecryptoECScalar *v11;
  void *v12;
  _QWORD v14[2];

  v5 = self;
  v14[1] = *MEMORY[0x1E0C80C00];
  MEMORY[0x1E0C80A78](self, a2, a3);
  v7 = (_QWORD **)((char *)v14 - v6);
  v9 = v8;
  objc_msgSend(v9, "length");
  v10 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "bytes");

  if (ccec_x963_import_priv())
  {
    v11 = 0;
  }
  else
  {
    v12 = malloc_type_malloc(-[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](v5, "scalarAllocationSizeForGroup:", a4), 0x5651F56CuLL);
    memcpy(v12, &v7[3 * **v7 + 2], -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](v5, "scalarAllocationSizeForGroup:", a4));
    v5 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:](v5, "initWithScalarPointer:forGroup:", v12, a4);
    v11 = v5;
  }

  return v11;
}

- (CKCBCorecryptoECScalar)initWithScalarPointer:(unint64_t *)a3 forGroup:(ccec_cp *)a4
{
  CKCBCorecryptoECScalar *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKCBCorecryptoECScalar;
  result = -[CKCBCorecryptoECScalar init](&v7, sel_init);
  if (result)
  {
    result->_group = a4;
    result->_corecryptoScalar = a3;
  }
  return result;
}

- (id)x963Representation
{
  void *v3;
  id v4;
  void *v5;
  CKCBCorecryptoECPoint *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)((uint64_t (*)(CKCBCorecryptoECScalar *, SEL))MEMORY[0x1E0C80A78])(self, a2), "serializedBigEndianScalar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCBCorecryptoECScalar group](self, "group");
  objc_msgSend(v3, "length");
  v4 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "bytes");
  v16 = ccec_raw_import_priv_only();
  if (v16)
  {
    v5 = 0;
  }
  else
  {
    v6 = -[CKCBCorecryptoECPoint initWithGeneratorForCP:]([CKCBCorecryptoECPoint alloc], "initWithGeneratorForCP:", self->_group);
    -[CKCBCorecryptoECPoint multiply:corecryptoError:](v6, "multiply:corecryptoError:", self, &v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v16)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v7, "serializedPublicKey:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "length");
      v10 = objc_retainAutorelease(v9);
      objc_msgSend(v10, "bytes");
      v16 = ccec_raw_import_pub();
      if (v16)
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 3 * ((unint64_t)(cczp_bitlen() + 7) >> 3) + 1);
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v11, "mutableBytes");
        v16 = ccec_x963_export();
        if (v16)
        {
          v5 = 0;
        }
        else
        {
          v12 = (void *)MEMORY[0x1E0C99D50];
          v13 = objc_retainAutorelease(v11);
          v5 = (void *)objc_msgSend(v12, "_newZeroingDataWithBytes:length:", objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));
          v14 = objc_retainAutorelease(v13);
          memset_s((void *)objc_msgSend(v14, "mutableBytes"), objc_msgSend(v14, "length"), 0, objc_msgSend(v14, "length"));
        }

      }
    }

  }
  return v5;
}

- (CKCBCorecryptoECScalar)initWithRandomScalarInGroup:(ccec_cp *)a3
{
  CKCBCorecryptoECScalar *v4;
  CKCBCorecryptoECScalar *v5;
  unint64_t *v6;
  CKCBCorecryptoECScalar *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKCBCorecryptoECScalar;
  v4 = -[CKCBCorecryptoECScalar init](&v9, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_7;
  v4->_group = a3;
  ccrng();
  v6 = (unint64_t *)malloc_type_malloc(-[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](v5, "scalarAllocationSizeForGroup:", a3), 0xD930612DuLL);
  if (!ccec_generate_scalar_fips_retry())
  {
    v5->_corecryptoScalar = v6;
LABEL_7:
    v7 = v5;
    goto LABEL_8;
  }
  free(v6);
  v7 = 0;
LABEL_8:

  return v7;
}

- (CKCBCorecryptoECScalar)initWithData:(id)a3 inGroup:(ccec_cp *)a4 reduction:(BOOL)a5 corecryptoError:(int *)a6
{
  id v9;
  size_t v10;
  void *v11;
  void *v12;
  id v13;
  int uint;
  CKCBCorecryptoECScalar *v15;

  v9 = a3;
  cczp_n();
  v10 = -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](self, "scalarAllocationSizeForGroup:", a4);
  v11 = malloc_type_malloc(2 * v10, 0x765C6046uLL);
  v12 = malloc_type_malloc(v10, 0x1A5E96D9uLL);
  objc_msgSend(v9, "length");
  v13 = objc_retainAutorelease(v9);
  objc_msgSend(v13, "bytes");

  uint = ccn_read_uint();
  *a6 = uint;
  if (uint)
  {
    free(v11);
  }
  else
  {
    *a6 = cczp_mod();
    free(v11);
    if (!*a6)
    {
      self = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:](self, "initWithScalarPointer:forGroup:", v12, a4);
      v15 = self;
      goto LABEL_5;
    }
  }
  free(v12);
  v15 = 0;
LABEL_5:

  return v15;
}

- (id)serializedBigEndianScalar
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](self, "scalarAllocationSizeForGroup:", -[CKCBCorecryptoECScalar group](self, "group")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "length");
  v3 = objc_retainAutorelease(v2);
  objc_msgSend(v3, "mutableBytes");
  if ((ccn_write_uint_padded_ct() & 0x80000000) != 0)
  {
    v6 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99D50];
    v5 = objc_retainAutorelease(v3);
    v6 = (void *)objc_msgSend(v4, "_newZeroingDataWithBytes:length:", objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  }
  v7 = objc_retainAutorelease(v3);
  memset_s((void *)objc_msgSend(v7, "mutableBytes"), objc_msgSend(v7, "length"), 0, objc_msgSend(v7, "length"));

  return v6;
}

- (id)mapToCurve_SSWU_RandomOracle
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = ((uint64_t (*)(CKCBCorecryptoECScalar *, SEL))MEMORY[0x1E0C80A78])(self, a2);
  v5 = (char *)v8 - v4;
  v6 = *(_QWORD *)(v3 + 8);
  if ((v6 == MEMORY[0x1D8264168]() || v6 == MEMORY[0x1D8264174]() || v6 == ccec_cp_521())
    && (-[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar"), !map_to_curve_sswu()))
  {
    return -[CKCBCorecryptoECPoint initWithPublicKey:]([CKCBCorecryptoECPoint alloc], "initWithPublicKey:", v5);
  }
  else
  {
    return 0;
  }
}

- (id)add:(id)a3 corecryptoError:(int *)a4
{
  id v6;
  void *v7;
  int v8;
  CKCBCorecryptoECScalar *v9;

  v6 = a3;
  v7 = malloc_type_malloc(-[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](self, "scalarAllocationSizeForGroup:", -[CKCBCorecryptoECScalar group](self, "group")), 0xCBCBDC5DuLL);
  -[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar");
  objc_msgSend(v6, "corecryptoScalar");

  v8 = cczp_add();
  *a4 = v8;
  if (v8)
  {
    free(v7);
    v9 = 0;
  }
  else
  {
    v9 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]([CKCBCorecryptoECScalar alloc], "initWithScalarPointer:forGroup:", v7, self->_group);
  }
  return v9;
}

- (id)sub:(id)a3 corecryptoError:(int *)a4
{
  id v6;
  ccec_cp *v7;
  void *v8;
  int v9;
  CKCBCorecryptoECScalar *v10;

  v6 = a3;
  v7 = -[CKCBCorecryptoECScalar group](self, "group");
  if (v7 == (ccec_cp *)objc_msgSend(v6, "group"))
  {
    v8 = malloc_type_malloc(-[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](self, "scalarAllocationSizeForGroup:", -[CKCBCorecryptoECScalar group](self, "group")), 0xFBD77C16uLL);
    -[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar");
    objc_msgSend(v6, "corecryptoScalar");
    v9 = cczp_sub();
    *a4 = v9;
    if (!v9)
    {
      v10 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]([CKCBCorecryptoECScalar alloc], "initWithScalarPointer:forGroup:", v8, self->_group);
      goto LABEL_5;
    }
    free(v8);
  }
  v10 = 0;
LABEL_5:

  return v10;
}

- (id)multiply:(id)a3 corecryptoError:(int *)a4
{
  id v6;
  ccec_cp *v7;
  uint64_t v8;
  void *v9;
  int v10;
  CKCBCorecryptoECScalar *v11;

  v6 = a3;
  v7 = -[CKCBCorecryptoECScalar group](self, "group");
  if (v7 == (ccec_cp *)objc_msgSend(v6, "group"))
  {
    v8 = cczp_n();
    v9 = malloc_type_malloc(8 * v8, 0xE6FB7448uLL);
    -[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar");
    objc_msgSend(v6, "corecryptoScalar");
    v10 = cczp_mul();
    *a4 = v10;
    if (!v10)
    {
      v11 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]([CKCBCorecryptoECScalar alloc], "initWithScalarPointer:forGroup:", v9, self->_group);
      goto LABEL_5;
    }
    free(v9);
  }
  v11 = 0;
LABEL_5:

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  ccec_cp *v5;
  BOOL v6;

  v4 = a3;
  v5 = -[CKCBCorecryptoECScalar group](self, "group");
  if (v5 == (ccec_cp *)objc_msgSend(v4, "group"))
  {
    objc_msgSend(v4, "corecryptoScalar");
    v6 = ccn_cmp() == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)inverseModOrder
{
  void *v3;
  CKCBCorecryptoECScalar *v4;

  v3 = malloc_type_malloc(-[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](self, "scalarAllocationSizeForGroup:", -[CKCBCorecryptoECScalar group](self, "group")), 0xBF7E8048uLL);
  -[CKCBCorecryptoECScalar corecryptoScalar](self, "corecryptoScalar");
  if (cczp_inv())
  {
    free(v3);
    v4 = 0;
  }
  else
  {
    v4 = -[CKCBCorecryptoECScalar initWithScalarPointer:forGroup:]([CKCBCorecryptoECScalar alloc], "initWithScalarPointer:forGroup:", v3, self->_group);
  }
  return v4;
}

- (void)dealloc
{
  rsize_t v3;
  objc_super v4;

  if (self->_corecryptoScalar)
  {
    v3 = -[CKCBCorecryptoECScalar scalarAllocationSizeForGroup:](self, "scalarAllocationSizeForGroup:", -[CKCBCorecryptoECScalar group](self, "group"));
    memset_s((void *)self->_corecryptoScalar, v3, 0, v3);
    free((void *)self->_corecryptoScalar);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKCBCorecryptoECScalar;
  -[CKCBCorecryptoECScalar dealloc](&v4, sel_dealloc);
}

- (ccec_cp)group
{
  return self->_group;
}

- (const)corecryptoScalar
{
  return self->_corecryptoScalar;
}

@end
