@implementation SGRe2PrefilterTree

- (SGRe2PrefilterTree)initWithData:(id)a3
{
  id v6;
  SGRe2PrefilterTree *v7;
  SGRe2PrefilterTree *v8;
  id v9;
  unsigned int *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  const unsigned __int16 *v14;
  uint64_t v15;
  const unsigned __int16 *rpns;
  const unsigned __int16 *h1;
  const unsigned __int16 *h2;
  const unsigned __int16 *h3;
  const char *s1;
  const char *s2;
  const unsigned __int16 *v22;
  unsigned __int16 v23;
  const unsigned __int16 *v24;
  const unsigned __int16 *v25;
  unsigned __int16 v26;
  const unsigned __int16 *v27;
  unsigned __int16 v28;
  const unsigned __int16 *v29;
  unsigned __int16 v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  objc_super v55;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "length") <= 0x1C)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGRe2PrefilterTree.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data.length > 7*sizeof(uint32_t)"));

  }
  v55.receiver = self;
  v55.super_class = (Class)SGRe2PrefilterTree;
  v7 = -[SGRe2PrefilterTree init](&v55, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    v9 = objc_retainAutorelease(v6);
    v10 = (unsigned int *)objc_msgSend(v9, "bytes");
    v11 = objc_retainAutorelease(v9);
    v12 = objc_msgSend(v11, "bytes");
    v13 = objc_msgSend(v11, "length");
    v14 = (const unsigned __int16 *)(v12 + v13);
    v15 = *v10;
    rpns = (const unsigned __int16 *)(v12 + v15);
    v8->_rpns = (const unsigned __int16 *)(v12 + v15);
    if (v12 + v15 > (unint64_t)(v12 + v13))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_rpns) <= (const uint8_t *)end"));

      rpns = v8->_rpns;
    }
    h1 = (const unsigned __int16 *)(v12 + v10[1]);
    h2 = (const unsigned __int16 *)(v12 + v10[2]);
    v8->_h1 = h1;
    v8->_h2 = h2;
    v8->_h3 = (const unsigned __int16 *)(v12 + v10[3]);
    if (rpns > h1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_rpns) <= (const uint8_t *)(_h1)"));

      h1 = v8->_h1;
      h2 = v8->_h2;
    }
    if (h1 > h2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h1) <= (const uint8_t *)(_h2)"));

      h2 = v8->_h2;
    }
    if (h2 > v8->_h3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h2) <= (const uint8_t *)(_h3)"));

    }
    if (v8->_h1 > v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h1) <= (const uint8_t *)end"));

    }
    if (v8->_h2 > v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h2) <= (const uint8_t *)end"));

    }
    h3 = v8->_h3;
    if (h3 > v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 62, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h3) <= (const uint8_t *)end"));

      h3 = v8->_h3;
    }
    s1 = (const char *)(v12 + v10[4]);
    s2 = (const char *)(v12 + v10[5]);
    v8->_s1 = s1;
    v8->_s2 = s2;
    v8->_s3 = (const char *)(v12 + v10[6]);
    if (h3 > (const unsigned __int16 *)s1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h3) <= (const uint8_t *)(_s1)"));

      s1 = v8->_s1;
      s2 = v8->_s2;
    }
    if (s1 > s2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_s1) <= (const uint8_t *)(_s2)"));

      s2 = v8->_s2;
    }
    if (s2 > v8->_s3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_s2) <= (const uint8_t *)(_s3)"));

    }
    if (v8->_s1 > (const char *)v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 75, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_s1) <= (const uint8_t *)end"));

    }
    if (v8->_s2 > (const char *)v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_s2) <= (const uint8_t *)end"));

    }
    if (v8->_s3 > (const char *)v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_s3) <= (const uint8_t *)end"));

    }
    v22 = v8->_rpns;
    v23 = *v22++;
    v8->_rpns = v22;
    v8->_nrpns = v23;
    if (v22 > v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_rpns) <= (const uint8_t *)end"));

    }
    v25 = v8->_h1;
    v24 = v8->_h2;
    v26 = *v25++;
    v8->_n1 = v26;
    v28 = *v24;
    v27 = v24 + 1;
    v8->_h1 = v25;
    v8->_h2 = v27;
    v8->_n2 = v28;
    v29 = v8->_h3;
    v30 = *v29;
    v8->_h3 = v29 + 1;
    v8->_n3 = v30;
    if (v25 > v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h1) <= (const uint8_t *)end"));

      v27 = v8->_h2;
    }
    if (v27 > v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h2) <= (const uint8_t *)end"));

    }
    if (v8->_h3 > v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const uint8_t *)(_h3) <= (const uint8_t *)end"));

    }
    v31 = (uint64_t)&v8->_h1[v8->_n1 + 1];
    if ((const unsigned __int16 *)v31 != v8->_h2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_h1 + _n1 + 1 == _h2"));

      v31 = (uint64_t)v8->_h2;
    }
    v32 = v31 + 2 * v8->_n2 + 2;
    if ((const unsigned __int16 *)v32 != v8->_h3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_h2 + _n2 + 1 == _h3"));

      v32 = (uint64_t)v8->_h3;
    }
    if ((const char *)(v32 + 2 * v8->_n3) != v8->_s1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SGRe2PrefilterTree.m"), 91, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(const void *)(_h3 + _n3 + 0) == (const void *)_s1"));

    }
  }

  return v8;
}

- (id)regexpIdsThatMightMatchUtf8:(const char *)a3
{
  uint64_t v4;
  const char *v5;
  int v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  int n3;
  unsigned int n2;
  unsigned int n1;
  const char *v15;
  unsigned __int8 v16;
  unsigned __int16 v17;
  unsigned int v18;
  const unsigned __int16 *h1;
  uint64_t v20;
  const char *s1;
  const char *v22;
  int v23;
  int v24;
  unsigned __int16 v25;
  unsigned int v26;
  const unsigned __int16 *h2;
  uint64_t v28;
  const char *s2;
  const char *v30;
  int v31;
  int v32;
  unsigned __int16 v33;
  unsigned int v34;
  const unsigned __int16 *h3;
  uint64_t v36;
  const char *s3;
  const char *v38;
  int v39;
  int v40;
  uint64_t v41;
  void *v42;
  int v43;
  uint64_t v44;
  const unsigned __int16 *rpns;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int16 v51;
  char *v52;
  char v53;
  char v54;
  char *v55;
  char v56;
  id v57;
  NSObject *v59;
  const char *v60;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  void *v65;
  void *v66;
  uint8_t buf[15];
  char v68;
  _OWORD v69[4];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  if (a3 && *a3)
  {
    v4 = objc_opt_new();
    v5 = a3;
    v66 = (void *)v4;
    v6 = *(unsigned __int8 *)a3;
    if (*a3)
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      if (self->_n3 <= 1u)
        n3 = 1;
      else
        n3 = self->_n3;
      n2 = self->_n2;
      if (n2 <= 1)
        n2 = 1;
      v63 = n2;
      v64 = n3;
      n1 = self->_n1;
      if (n1 <= 1)
        n1 = 1;
      v62 = n1;
      v15 = a3;
      do
      {
        v16 = v6 + 32 * ((v6 - 65) < 0x1A);
        v11 = 33 * (v11 - 1089 * BYTE2(v8)) + v16;
        if (v7 >= 2)
        {
          v17 = self->_n1;
          if (v17)
          {
            v18 = v11 % v62;
            h1 = self->_h1;
            while (h1[v18] != 0xFFFF)
            {
              v20 = 0;
              s1 = self->_s1;
              v22 = &s1[h1[v18]];
              while (1)
              {
                v23 = v22[v20];
                if (!v22[v20])
                  break;
                v24 = v15[v20 - 2];
                if (v15[v20 - 2])
                {
                  ++v20;
                  if (v24 + 32 * ((v24 - 65) < 0x1A) == v23)
                    continue;
                }
                goto LABEL_20;
              }
              objc_msgSend(v66, "addIndex:", *(unsigned __int16 *)&s1[h1[v18] - 2]);
              v5 = a3;
              v17 = self->_n1;
              h1 = self->_h1;
LABEL_20:
              if ((int)(v18 + 1) < v17)
                ++v18;
              else
                v18 = 0;
            }
          }
        }
        v10 = 33 * (v10 - 39135393 * BYTE5(v8)) + v16;
        if (v7 >= 5)
        {
          v25 = self->_n2;
          if (v25)
          {
            v26 = v10 % v63;
            h2 = self->_h2;
            while (h2[v26] != 0xFFFF)
            {
              v28 = 0;
              s2 = self->_s2;
              v30 = &s2[h2[v26]];
              while (1)
              {
                v31 = v30[v28];
                if (!v30[v28])
                  break;
                v32 = v15[v28 - 5];
                if (v15[v28 - 5])
                {
                  ++v28;
                  if (v32 + 32 * ((v32 - 65) < 0x1A) == v31)
                    continue;
                }
                goto LABEL_32;
              }
              objc_msgSend(v66, "addIndex:", *(unsigned __int16 *)&s2[h2[v26] - 2]);
              v5 = a3;
              v25 = self->_n2;
              h2 = self->_h2;
LABEL_32:
              if ((int)(v26 + 1) < v25)
                ++v26;
              else
                v26 = 0;
            }
          }
        }
        v9 = 33 * (v9 + 331229983 * HIBYTE(v8)) + v16;
        if (v7 >= 7)
        {
          v33 = self->_n3;
          if (v33)
          {
            v34 = v9 % v64;
            h3 = self->_h3;
            while (h3[v34] != 0xFFFF)
            {
              v36 = 0;
              s3 = self->_s3;
              v38 = &s3[h3[v34]];
              while (1)
              {
                v39 = v38[v36];
                if (!v38[v36])
                  break;
                v40 = v15[v36 - 7];
                if (v15[v36 - 7])
                {
                  ++v36;
                  if (v40 + 32 * ((v40 - 65) < 0x1A) == v39)
                    continue;
                }
                goto LABEL_44;
              }
              objc_msgSend(v66, "addIndex:", *(unsigned __int16 *)&s3[h3[v34] - 2]);
              v5 = a3;
              v33 = self->_n3;
              h3 = self->_h3;
LABEL_44:
              if ((int)(v34 + 1) < v33)
                ++v34;
              else
                v34 = 0;
            }
          }
        }
        v8 = v16 | (v8 << 8);
        v6 = v5[++v7];
        ++v15;
      }
      while (v5[v7]);
    }
    v41 = objc_opt_new();
    v42 = (void *)v41;
    memset(v69, 0, sizeof(v69));
    if (!self->_nrpns)
      goto LABEL_75;
    v43 = 0;
    v44 = 0;
    rpns = self->_rpns;
    v65 = (void *)v41;
    while (1)
    {
      v47 = *rpns++;
      v46 = v47;
      if (!v47)
        goto LABEL_72;
      v48 = 0;
      v49 = 0;
LABEL_53:
      if (v49 == 64)
        break;
      v50 = rpns[1];
      switch(*rpns)
      {
        case 0u:
          *((_BYTE *)v69 + v49) = objc_msgSend(v66, "containsIndex:", v50);
          goto LABEL_69;
        case 1u:
          if (v49 < v50)
            goto LABEL_81;
          if (!rpns[1])
          {
            v53 = 1;
            goto LABEL_68;
          }
          v51 = v50 - 1;
          v52 = &v68 + v49;
          v53 = 1;
          do
          {
            v54 = *v52--;
            v53 &= v54;
            LODWORD(v50) = v50 - 1;
          }
          while ((_WORD)v50);
          goto LABEL_65;
        case 2u:
          if (v49 < v50)
          {
LABEL_81:
            sgLogHandle();
            v59 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v60 = "Prefilter tree stack underflow";
LABEL_83:
              _os_log_impl(&dword_1C3607000, v59, OS_LOG_TYPE_DEFAULT, v60, buf, 2u);
            }
            goto LABEL_84;
          }
          v53 = 0;
          if (rpns[1])
          {
            v51 = v50 - 1;
            v55 = &v68 + v49;
            do
            {
              v56 = *v55--;
              v53 |= v56;
              LODWORD(v50) = v50 - 1;
            }
            while ((_WORD)v50);
LABEL_65:
            v49 += ~v51 | 0xFFFFFFFFFFFF0000;
          }
LABEL_68:
          *((_BYTE *)v69 + v49) = v53;
LABEL_69:
          ++v49;
LABEL_70:
          rpns += 2;
          if (++v48 != v46)
            goto LABEL_53;
          v43 = LOBYTE(v69[0]);
          v42 = v65;
LABEL_72:
          if (v43)
            objc_msgSend(v42, "addIndex:", v44);
          if (++v44 >= (unint64_t)self->_nrpns)
          {
LABEL_75:
            v57 = v42;
            goto LABEL_76;
          }
          break;
        case 3u:
          *((_BYTE *)v69 + v49) = 1;
          goto LABEL_69;
        default:
          goto LABEL_70;
      }
    }
    sgLogHandle();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v60 = "Prefilter tree stack overflow";
      goto LABEL_83;
    }
LABEL_84:

    v57 = 0;
    v42 = v65;
LABEL_76:

  }
  else
  {
    v57 = 0;
  }
  return v57;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
