@implementation SGRe2Basic

- (SGRe2Basic)initWithRegexp:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  SGRe2Basic *v10;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99D50]);
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");
  v8 = objc_retainAutorelease(v6);
  v9 = (void *)objc_msgSend(v5, "initWithBytes:length:", v7, strlen((const char *)objc_msgSend(v8, "UTF8String")) + 1);
  v10 = -[SGRe2Basic initWithRegexpData:](self, "initWithRegexpData:", v9);

  return v10;
}

- (SGRe2Basic)initWithRegexpData:(id)a3
{
  id v5;
  SGRe2Basic *v6;
  SGRe2Basic *v7;
  id *p_patternData;
  uint64_t v9;
  int v10;
  re2::RE2 *v11;
  __int128 v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SGRe2Basic;
  v6 = -[SGRe2Basic init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    p_patternData = (id *)&v6->_patternData;
    objc_storeStrong((id *)&v6->_patternData, a3);
    v17 = 0;
    v9 = objc_msgSend(*p_patternData, "bytes");
    v10 = objc_msgSend(*p_patternData, "length");
    v16 = v9;
    v17 = (v10 - 1);
    v14 = 0;
    v15 = 1;
    v13 = xmmword_1C385A5B0;
    LODWORD(v13) = 1;
    *(_WORD *)((char *)&v13 + 5) = 256;
    v11 = (re2::RE2 *)operator new();
    re2::RE2::RE2(v11, (const re2::StringPiece *)&v16, (const re2::RE2::Options *)&v13);
    v7->_pattern = v11;
  }

  return v7;
}

- (void)dealloc
{
  SGRe2Basic *v2;
  re2::RE2 *pattern;
  objc_super v4;

  v2 = self;
  objc_sync_enter(v2);
  pattern = (re2::RE2 *)v2->_pattern;
  if (pattern)
  {
    re2::RE2::~RE2(pattern);
    MEMORY[0x1C3BD4858]();
  }
  objc_sync_exit(v2);

  v4.receiver = v2;
  v4.super_class = (Class)SGRe2Basic;
  -[SGRe2Basic dealloc](&v4, sel_dealloc);
}

- (id)existsInUtf8:(const char *)a3
{
  const char *v3;
  SGRe2Basic *v4;
  _QWORD v6[2];

  if (!a3)
    goto LABEL_4;
  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v6[0] = v3;
  v6[1] = strlen(v3);
  LOBYTE(v3) = re2::RE2::DoMatch((uint64_t)v4->_pattern, (uint64_t)v6, 0, 0, 0, 0);
  objc_sync_exit(v4);
  if ((v3 & 1) == 0)
  {

LABEL_4:
    v4 = 0;
  }
  return v4;
}

- (id)matchesUtf8:(const char *)a3
{
  const char *v3;
  SGRe2Basic *v4;
  _QWORD v6[2];

  if (!a3)
    goto LABEL_4;
  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v6[0] = v3;
  v6[1] = strlen(v3);
  LOBYTE(v3) = re2::RE2::DoMatch((uint64_t)v4->_pattern, (uint64_t)v6, 2, 0, 0, 0);
  objc_sync_exit(v4);
  if ((v3 & 1) == 0)
  {

LABEL_4:
    v4 = 0;
  }
  return v4;
}

- (void)enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SGRe2Basic_enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke;
  v12[3] = &unk_1E7DB4DD0;
  v13 = v10;
  v11 = v10;
  -[SGRe2Basic _enumerateMatchesInUtf8:fromString:ngroups:block:](self, "_enumerateMatchesInUtf8:fromString:ngroups:block:", a3, a4, a5, v12);

}

- (int)_enumerateMatchesInUtf8:(const char *)a3 fromString:(id)a4 ngroups:(unint64_t)a5 block:(id)a6
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  re2::StringPiece *v13;
  uint64_t v14;
  int v15;
  int v16;
  char *v17;
  int v18;
  size_t v19;
  unint64_t v20;
  char *v21;
  size_t v22;
  SGRe2Basic *v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  int *v31;
  int *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t i;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  _QWORD *v43;
  uint64_t v44;
  int v45;
  BOOL v46;
  uint64_t *v47;
  _QWORD *v48;
  BOOL v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  _QWORD *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  uint64_t *v59;
  _QWORD *v60;
  void *v61;
  char v62;
  int v63;
  SGRe2Basic *v64;
  int v66;
  int v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  int v74;
  __CFString *v75;
  int *v76;
  _BOOL4 v77;
  uint64_t v78;
  size_t v79;
  uint64_t (**v80)(id, char *, char *);
  unsigned int v81;
  SGRe2Basic *v82;
  size_t v83;
  char *v84;
  _OWORD memptr[12];
  __int128 v86;
  __int128 v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v75 = (__CFString *)a4;
  v80 = (uint64_t (**)(id, char *, char *))a6;
  if (a3)
  {
    v10 = a5 + 1;
    *(_QWORD *)&v87 = a3;
    v79 = strlen(a3);
    *((_QWORD *)&v87 + 1) = v79;
    v11 = 16 * (a5 + 1);
    v12 = operator new[]();
    v13 = (re2::StringPiece *)v12;
    if (a5 == -1)
      goto LABEL_9;
    v14 = v12;
    do
    {
      *(_QWORD *)v14 = 0;
      *(_DWORD *)(v14 + 8) = 0;
      v14 += 16;
    }
    while (v14 != v12 + 16 * v10);
    memptr[0] = 0uLL;
    if (((24 * v10) | 7) <= 0xC0)
    {
LABEL_9:
      MEMORY[0x1E0C80A78]();
      v17 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v17, v19);
      v16 = 0;
    }
    else
    {
      v15 = malloc_type_posix_memalign((void **)memptr, 8uLL, 24 * v10, 0x1050040C058ABA2uLL);
      BYTE8(memptr[0]) = 0;
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v70 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v70);
      }
      v16 = 1;
      v17 = *(char **)&memptr[0];
    }
    v20 = (32 * v10) | 7;
    memptr[0] = 0uLL;
    v74 = v16;
    v73 = v20;
    if (v20 > 0xC0)
    {
      v66 = malloc_type_posix_memalign((void **)memptr, 8uLL, 32 * v10, 0x10000409B4BCFF8uLL);
      BYTE8(memptr[0]) = 0;
      if (v66)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v68 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v68);
      }
      v21 = *(char **)&memptr[0];
    }
    else
    {
      MEMORY[0x1E0C80A78]();
      v21 = (char *)&v71 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v21, (32 * v10) | 7);
    }
    memptr[0] = 0uLL;
    v72 = v11 | 7;
    if ((v11 | 7) > 0xC0)
    {
      v67 = malloc_type_posix_memalign((void **)memptr, 8uLL, 16 * v10, 0x100004000313F17uLL);
      BYTE8(memptr[0]) = 0;
      if (v67)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v69 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v69);
      }
      v84 = *(char **)&memptr[0];
    }
    else
    {
      MEMORY[0x1E0C80A78]();
      v84 = (char *)&v71 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v84, v22);
    }
    v23 = self;
    objc_sync_enter(v23);
    v82 = v23;
    v78 = 24;
    v24 = re2::RE2::CapturingGroupNames((re2::RE2 *)v23->_pattern);
    if (v75)
      v77 = CFStringGetCStringPtr(v75, 0x600u) == 0;
    else
      v77 = 0;
    v86 = 0u;
    memset(memptr, 0, sizeof(memptr));
    _PASUtfNCursorInit();
    v25 = 0;
    v26 = a5 + 1;
    v83 = 2 * v10;
    v27 = (_QWORD *)(v24 + 8);
    v76 = (int *)((char *)v13 + 8);
    while (1)
    {
      v28 = *(uint64_t *)((char *)&v82->super.super.isa + v78);
      v81 = v25;
      if (!re2::RE2::Match(v28, &v87, v25, v79, 0, v13, v26))
      {
        v18 = 1;
        goto LABEL_80;
      }
      if (v77)
      {
        if (a5 != -1)
        {
          v29 = 0;
          v30 = 1;
          v31 = v76;
          v32 = v76;
          do
          {
            v34 = *v32;
            v32 += 4;
            v33 = v34;
            if ((_DWORD)v34)
              v35 = *((_QWORD *)v31 - 1) - (_QWORD)a3;
            else
              v35 = 0;
            v36 = &v21[16 * v29];
            *(_QWORD *)v36 = v35;
            v37 = &v21[16 * (v29 + 1)];
            *(_QWORD *)v37 = v35 + v33;
            v36[8] = v29;
            v37[8] = v29 + 1;
            v29 += 2;
            v46 = v26 > v30++;
            v31 = v32;
          }
          while (v46);
        }
        qsort_b(v21, v83, 0x10uLL, &__block_literal_global_29351);
        if (v83)
        {
          for (i = 0; i != v83; ++i)
          {
            while ((unint64_t)v86 < *(_QWORD *)&v21[16 * i] && (_PASUtfNCursorAdvance() & 1) != 0)
              ;
            *(_QWORD *)&v84[8 * v21[16 * i + 8]] = *((_QWORD *)&v86 + 1);
          }
        }
        if (a5 != -1)
        {
          v39 = 0;
          v40 = *v27;
          do
          {
            v41 = *((_QWORD *)v13 + 2 * v39);
            if (v41)
            {
              v42 = &v84[16 * v39];
              *(_QWORD *)&v17[24 * v39] = *(_QWORD *)v42;
              v41 = *((_QWORD *)v42 + 1) - *(_QWORD *)v42;
            }
            else
            {
              *(_QWORD *)&v17[24 * v39] = 0x7FFFFFFFFFFFFFFFLL;
            }
            *(_QWORD *)&v17[24 * v39 + 8] = v41;
            if (!v40)
              goto LABEL_46;
            v43 = v27;
            v44 = v40;
            do
            {
              v45 = *(_DWORD *)(v44 + 32);
              v46 = v45 < (int)v39;
              if (v45 >= (int)v39)
                v47 = (uint64_t *)v44;
              else
                v47 = (uint64_t *)(v44 + 8);
              if (!v46)
                v43 = (_QWORD *)v44;
              v44 = *v47;
            }
            while (*v47);
            if (v43 != v27 && *((_DWORD *)v43 + 8) <= (int)v39)
            {
              v48 = v43 + 5;
              if (*((char *)v43 + 63) < 0)
                v48 = (_QWORD *)*v48;
            }
            else
            {
LABEL_46:
              v48 = 0;
            }
            *(_QWORD *)&v17[24 * v39 + 16] = v48;
            v49 = v39++ == a5;
          }
          while (!v49);
        }
      }
      else if (a5 != -1)
      {
        v50 = 0;
        v51 = *v27;
        do
        {
          v52 = *((int *)v13 + 4 * v50 + 2);
          if ((_DWORD)v52)
          {
            v53 = *((_QWORD *)v13 + 2 * v50) - (_QWORD)a3;
          }
          else
          {
            v52 = 0;
            v53 = 0x7FFFFFFFFFFFFFFFLL;
          }
          v54 = (uint64_t *)&v17[24 * v50];
          *v54 = v53;
          v54[1] = v52;
          if (!v51)
            goto LABEL_68;
          v55 = v27;
          v56 = v51;
          do
          {
            v57 = *(int *)(v56 + 32);
            v58 = v50 <= v57;
            if (v50 <= v57)
              v59 = (uint64_t *)v56;
            else
              v59 = (uint64_t *)(v56 + 8);
            if (v58)
              v55 = (_QWORD *)v56;
            v56 = *v59;
          }
          while (*v59);
          if (v55 != v27 && v50 >= *((int *)v55 + 8))
          {
            v60 = v55 + 5;
            if (*((char *)v55 + 63) < 0)
              v60 = (_QWORD *)*v60;
          }
          else
          {
LABEL_68:
            v60 = 0;
          }
          *(_QWORD *)&v17[24 * v50 + 16] = v60;
          v49 = v50++ == a5;
        }
        while (!v49);
      }
      v61 = (void *)MEMORY[0x1C3BD4F6C]();
      v62 = v80[2](v80, v17, (char *)v82);
      objc_autoreleasePoolPop(v61);
      if ((v62 & 1) == 0)
        break;
      v63 = *((_DWORD *)v13 + 2);
      if (v63)
        v25 = v63 + *(_DWORD *)v13 - (_DWORD)a3;
      else
        v25 = v81 + 1;
    }
    v18 = 0;
LABEL_80:
    v64 = v82;
    objc_sync_exit(v82);

    if (v74)
      free(v17);
    if (v73 >= 0xC1)
      free(v21);
    if (v72 >= 0xC1)
      free(v84);
    MEMORY[0x1C3BD4840](v13, 0x1050C80DB1D6C16);
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (id)description
{
  SGRe2Basic *v2;
  int *pattern;
  __CFString *v4;
  void *v5;

  v2 = self;
  objc_sync_enter(v2);
  pattern = (int *)v2->_pattern;
  if (pattern)
    v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", *((_QWORD *)pattern + 1), pattern[4], 4, 0);
  else
    v4 = CFSTR("nil");
  objc_sync_exit(v2);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<RE2 %@>"), v4);
  return v5;
}

- (id)hashId
{
  void *v3;
  const void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 20);
  v4 = -[NSData bytes](self->_patternData, "bytes");
  v5 = -[NSData length](self->_patternData, "length");
  v6 = objc_retainAutorelease(v3);
  CC_SHA1(v4, v5 - 1, (unsigned __int8 *)objc_msgSend(v6, "mutableBytes"));
  objc_msgSend(v6, "base64EncodedDataWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "length") >= 0x1B)
  {
    v9 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
    v10 = 0;
    memset(v15, 0, 27);
    v11 = MEMORY[0x1E0C80978];
    do
    {
      v12 = *(char *)(v9 + v10);
      if ((v12 & 0x80000000) != 0)
        v13 = __maskrune(*(char *)(v9 + v10), 0x500uLL);
      else
        v13 = *(_DWORD *)(v11 + 4 * v12 + 60) & 0x500;
      if (!v13)
      {
        if (v12 == 43)
        {
          LOBYTE(v12) = 45;
        }
        else
        {
          if (v12 != 47)
            __break(1u);
          LOBYTE(v12) = 95;
        }
      }
      *((_BYTE *)v15 + v10++) = v12;
    }
    while (v10 != 27);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v15, 27, 1);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternData, 0);
}

uint64_t __63__SGRe2Basic__enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  return (*a2 - *a3);
}

uint64_t __62__SGRe2Basic_enumerateMatchesInUtf8_fromString_ngroups_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
