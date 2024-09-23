@implementation ATXHeuristicAirportCity

+ (id)supportedLanguages
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(CFSTR("ar,de,en,es,ja,ko,ru,vi,zh"), "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithArray:", v3);

  return v4;
}

+ (id)cityForAirport:(id)a3 language:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  char v17;
  id v18;
  char *v19;
  char *v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  _BYTE *v28;
  double v29;
  double v30;
  unsigned __int8 *v31;
  void *v32;
  uint64_t v33;
  id v34;
  _WORD *v35;
  _BYTE *v36;
  uint64_t v37;
  uint64_t v39;
  void *v40;
  id obj;
  char __little;
  __int16 v43;
  char v44;
  __int16 v45;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length") == 3 && objc_msgSend(v7, "canBeConvertedToEncoding:", 1))
  {
    objc_msgSend(v7, "uppercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "supportedLanguages");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsObject:", v8);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "pathForResource:ofType:", CFSTR("airport-names"), CFSTR("dat"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXHeuristicAirportCity.m"), 31, CFSTR("Airport name data not found"));

      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v13, 1, 0);
      if (v14)
      {
        __little = 0;
        v15 = objc_retainAutorelease(v9);
        v16 = objc_msgSend(v15, "UTF8String");
        v17 = *(_BYTE *)(v16 + 2);
        v43 = *(_WORD *)v16;
        v44 = v17;
        v18 = objc_retainAutorelease(v14);
        v19 = (char *)memmem((const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), &__little, 4uLL);
        if (v19)
        {
          v20 = v19;
          v21 = objc_retainAutorelease(v18);
          v22 = objc_msgSend(v21, "bytes");
          v23 = v22 + objc_msgSend(v21, "length");
          v24 = v20 + 9;
          if ((unint64_t)(v20 + 9) < v23)
          {
            obj = v15;
            v25 = v20[8];
            v26 = *((unsigned int *)v20 + 1);
            v27 = v8;
            v28 = v20 + 12;
            if ((unint64_t)(v20 + 12) >= v23)
            {
              v37 = 0;
              v32 = v27;
LABEL_20:

LABEL_25:
              goto LABEL_17;
            }
            v29 = (double)((v26 | (unint64_t)(v25 << 32)) >> 20) * 0.000171661377 + -90.0;
            v30 = (double)(v26 & 0xFFFFF) * 0.000343322754 + -180.0;
            v31 = (unsigned __int8 *)(v20 + 11);
            v32 = v27;
            while (1)
            {
              if (!*v24 || (v45 = *(_WORD *)v24, v33 = *v31, (unint64_t)&v28[v33] >= v23))
              {
LABEL_15:
                v37 = 0;
                goto LABEL_20;
              }
              v34 = objc_retainAutorelease(v32);
              v35 = (_WORD *)objc_msgSend(v34, "UTF8String");
              if (v45 == *v35)
                break;
              v36 = &v24[v33];
              v24 += v33 + 3;
              v31 = v36 + 5;
              v28 = v36 + 6;
              if ((unint64_t)(v36 + 6) >= v23)
                goto LABEL_15;
            }
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v28, v33, 4);

            if (v32)
            {
              v39 = objc_opt_new();
              v37 = v39;
              if (v39)
              {
                objc_storeStrong((id *)(v39 + 8), obj);
                objc_storeStrong((id *)(v37 + 16), v32);
                objc_storeStrong((id *)(v37 + 24), v34);
                *(double *)(v37 + 32) = v29;
                *(double *)(v37 + 40) = v30;
              }
              goto LABEL_20;
            }
          }
        }
      }
      v37 = 0;
      goto LABEL_25;
    }
    v37 = 0;
  }
  else
  {
    v37 = 0;
    v9 = v7;
  }
LABEL_17:

  return (id)v37;
}

+ (id)cityForAirport:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "autoupdatingCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "cityForAirport:language:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)iata
{
  return self->_iata;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)isoLanguage
{
  return self->_isoLanguage;
}

- (double)latitude
{
  return self->_latitude;
}

- (double)longitude
{
  return self->_longitude;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoLanguage, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_iata, 0);
}

@end
