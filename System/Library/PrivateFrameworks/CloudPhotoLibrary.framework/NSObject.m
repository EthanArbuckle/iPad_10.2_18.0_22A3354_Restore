@implementation NSObject

void __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  __darwin_ct_rune_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t *v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  NSObject *v21;
  double v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  _DWORD *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double *v35;
  float *v36;
  _WORD *v37;
  double *v38;
  NSObject *v39;
  double *v40;
  int v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = a1[6];
  if (!v8
    || ((*(uint64_t (**)(uint64_t, _QWORD, _QWORD, id, uint64_t, uint64_t))(v8 + 16))(v8, a1[4], a1[5], v5, objc_msgSend(v6, "propertySetter"), objc_msgSend(v6, "propertyGetter")) & 1) == 0)
  {
    v9 = __tolower(objc_msgSend(v7, "propertyType"));
    if (v9 <= 97)
    {
      if (v9 == 35)
      {
        v10 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
        v11 = objc_msgSend(v7, "propertySetter");
        if (v11)
LABEL_41:
          ((void (*)(_QWORD, uint64_t, uint64_t))objc_msgSend(v7, "propertySetterIMP"))(a1[4], v11, v10);
        else
          objc_msgSend(v7, "setIvarValue:forObject:", v10, a1[4]);
      }
      else if (v9 == 64)
      {
        ((void (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "cplDeepCopy");
        v15 = objc_msgSend(v7, "propertySetter");
        if (v15)
          ((void (*)(_QWORD, uint64_t, void *))objc_msgSend(v7, "propertySetterIMP"))(a1[4], v15, v14);
        else
          objc_msgSend(v7, "setIvarValue:forObject:", v14, a1[4]);

LABEL_44:
      }
      else
      {
LABEL_23:
        if (!_CPLSilentLogging)
        {
          __CPLCodingOSLogDomain();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v41 = 138412546;
            v42 = v5;
            v43 = 1024;
            LODWORD(v44) = objc_msgSend(v7, "propertyType");
            _os_log_impl(&dword_1B03C2000, v21, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v41, 0x12u);
          }

        }
      }
    }
    else
    {
      switch(v9)
      {
        case 'b':
        case 'c':
          v10 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ((objc_msgSend(v7, "isReadOnly") & 1) != 0)
            break;
          v11 = objc_msgSend(v7, "propertySetter");
          if (v11)
            goto LABEL_41;
          v12 = (_BYTE *)objc_msgSend(v7, "ivarAddrForObject:", a1[4]);
          if (v12)
            *v12 = v10;
          break;
        case 'd':
          v22 = ((double (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ((objc_msgSend(v7, "isReadOnly") & 1) == 0)
          {
            v23 = objc_msgSend(v7, "propertySetter");
            if (v23)
            {
              ((void (*)(_QWORD, uint64_t, double))objc_msgSend(v7, "propertySetterIMP"))(a1[4], v23, v22);
            }
            else
            {
              v35 = (double *)objc_msgSend(v7, "ivarAddrForObject:", a1[4]);
              if (v35)
                *v35 = v22;
            }
          }
          break;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_23;
        case 'f':
          v24 = ((float (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ((objc_msgSend(v7, "isReadOnly") & 1) == 0)
          {
            v25 = objc_msgSend(v7, "propertySetter");
            if (v25)
            {
              ((void (*)(_QWORD, uint64_t, float))objc_msgSend(v7, "propertySetterIMP"))(a1[4], v25, v24);
            }
            else
            {
              v36 = (float *)objc_msgSend(v7, "ivarAddrForObject:", a1[4]);
              if (v36)
                *v36 = v24;
            }
          }
          break;
        case 'i':
          v10 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ((objc_msgSend(v7, "isReadOnly") & 1) != 0)
            break;
          v11 = objc_msgSend(v7, "propertySetter");
          if (v11)
            goto LABEL_41;
          v26 = (_DWORD *)objc_msgSend(v7, "ivarAddrForObject:", a1[4]);
          if (v26)
            *v26 = v10;
          break;
        case 'l':
        case 'q':
          v10 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ((objc_msgSend(v7, "isReadOnly") & 1) != 0)
            break;
          v11 = objc_msgSend(v7, "propertySetter");
          if (v11)
            goto LABEL_41;
          v16 = (uint64_t *)objc_msgSend(v7, "ivarAddrForObject:", a1[4]);
          if (v16)
            *v16 = v10;
          break;
        case 's':
          v10 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
          if ((objc_msgSend(v7, "isReadOnly") & 1) != 0)
            break;
          v11 = objc_msgSend(v7, "propertySetter");
          if (v11)
            goto LABEL_41;
          v37 = (_WORD *)objc_msgSend(v7, "ivarAddrForObject:", a1[4]);
          if (v37)
            *v37 = v10;
          break;
        default:
          if (v9 != 123)
            goto LABEL_23;
          objc_msgSend(v7, "structName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CGSize")) & 1) != 0
            || objc_msgSend(v13, "isEqualToString:", CFSTR("NSSize")))
          {
            goto LABEL_20;
          }
          if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CGRect")) & 1) != 0
            || objc_msgSend(v13, "isEqualToString:", CFSTR("NSRect")))
          {
            v27 = ((double (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
            v29 = v28;
            v31 = v30;
            v33 = v32;
            if ((objc_msgSend(v7, "isReadOnly") & 1) == 0)
            {
              v34 = objc_msgSend(v7, "propertySetter");
              if (v34)
              {
                ((void (*)(_QWORD, uint64_t, double, double, double, double))objc_msgSend(v7, "propertySetterIMP"))(a1[4], v34, v27, v29, v31, v33);
              }
              else
              {
                v40 = (double *)objc_msgSend(v7, "ivarAddrForObject:", a1[4]);
                if (v40)
                {
                  *v40 = v27;
                  v40[1] = v29;
                  v40[2] = v31;
                  v40[3] = v33;
                }
              }
            }
          }
          else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CGPoint")) & 1) != 0
                 || objc_msgSend(v13, "isEqualToString:", CFSTR("NSPoint")))
          {
LABEL_20:
            v17 = ((double (*)(_QWORD, uint64_t))objc_msgSend(v7, "propertyGetterIMP"))(a1[5], objc_msgSend(v7, "propertyGetter"));
            v19 = v18;
            if ((objc_msgSend(v7, "isReadOnly") & 1) == 0)
            {
              v20 = objc_msgSend(v7, "propertySetter");
              if (v20)
              {
                ((void (*)(_QWORD, uint64_t, double, double))objc_msgSend(v7, "propertySetterIMP"))(a1[4], v20, v17, v19);
              }
              else
              {
                v38 = (double *)objc_msgSend(v7, "ivarAddrForObject:", a1[4]);
                if (v38)
                {
                  *v38 = v17;
                  v38[1] = v19;
                }
              }
            }
          }
          else if (!_CPLSilentLogging)
          {
            __CPLCodingOSLogDomain();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            {
              v41 = 138412546;
              v42 = v5;
              v43 = 2112;
              v44 = v13;
              _os_log_impl(&dword_1B03C2000, v39, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v41, 0x16u);
            }

          }
          goto LABEL_44;
      }
    }
  }

}

uint64_t __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke_124(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __77__NSObject_CPLCodingProxy___cplCopyProperties_fromOtherObject_withCopyBlock___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  if ((void *)a1[4] != a2)
  {
    v5 = (void *)a1[5];
    v4 = a1[6];
    v6 = a2;
    objc_msgSend(v5, "objectAtIndex:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

  }
}

void __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __darwin_ct_rune_t v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(_QWORD, uint64_t, double, double);
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(_QWORD, uint64_t, double, double, double, double);
  _WORD *v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_QWORD, uint64_t, double, double);
  _OWORD *v28;
  __int128 v29;
  NSObject *v30;
  int v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = __tolower(objc_msgSend(v6, "propertyType"));
  if (v7 <= 97)
  {
    if (v7 == 35 || v7 == 64)
    {
      v8 = objc_msgSend(v6, "propertySetter");
      if (v8)
LABEL_13:
        ((void (*)(_QWORD, uint64_t, _QWORD))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 32), v8, 0);
      else
        objc_msgSend(v6, "setIvarValue:forObject:", 0, *(_QWORD *)(a1 + 32));
    }
    else
    {
LABEL_20:
      if (!_CPLSilentLogging)
      {
        __CPLCodingOSLogDomain();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v31 = 138412546;
          v32 = v5;
          v33 = 1024;
          LODWORD(v34) = objc_msgSend(v6, "propertyType");
          _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v31, 0x12u);
        }

      }
    }
  }
  else
  {
    switch(v7)
    {
      case 'b':
      case 'c':
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          break;
        v8 = objc_msgSend(v6, "propertySetter");
        if (v8)
          goto LABEL_13;
        v9 = (_BYTE *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 32));
        if (v9)
          *v9 = 0;
        break;
      case 'd':
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          break;
        v15 = objc_msgSend(v6, "propertySetter");
        if (!v15)
          goto LABEL_37;
        ((void (*)(_QWORD, uint64_t, double))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 32), v15, 0.0);
        break;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_20;
      case 'f':
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          break;
        v16 = objc_msgSend(v6, "propertySetter");
        if (!v16)
          goto LABEL_32;
        ((void (*)(_QWORD, uint64_t, float))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 32), v16, 0.0);
        break;
      case 'i':
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          break;
        v8 = objc_msgSend(v6, "propertySetter");
        if (v8)
          goto LABEL_13;
LABEL_32:
        v17 = (_DWORD *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 32));
        if (v17)
          *v17 = 0;
        break;
      case 'l':
      case 'q':
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          break;
        v8 = objc_msgSend(v6, "propertySetter");
        if (v8)
          goto LABEL_13;
LABEL_37:
        v18 = (_QWORD *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 32));
        if (v18)
          *v18 = 0;
        break;
      case 's':
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          break;
        v8 = objc_msgSend(v6, "propertySetter");
        if (v8)
          goto LABEL_13;
        v22 = (_WORD *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 32));
        if (v22)
          *v22 = 0;
        break;
      default:
        if (v7 != 123)
          goto LABEL_20;
        objc_msgSend(v6, "structName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CGSize")) & 1) != 0
          || objc_msgSend(v10, "isEqualToString:", CFSTR("NSSize")))
        {
          if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
            goto LABEL_60;
          v11 = objc_msgSend(v6, "propertySetter");
          if (v11)
          {
            v12 = v11;
            v13 = (void (*)(_QWORD, uint64_t, double, double))objc_msgSend(v6, "propertySetterIMP");
            v13(*(_QWORD *)(a1 + 32), v12, *MEMORY[0x1E0CB3440], *(double *)(MEMORY[0x1E0CB3440] + 8));
            goto LABEL_60;
          }
          v23 = (_OWORD *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 32));
          if (v23)
          {
            v24 = (_OWORD *)MEMORY[0x1E0CB3440];
LABEL_48:
            *v23 = *v24;
          }
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CGRect")) & 1) != 0
               || objc_msgSend(v10, "isEqualToString:", CFSTR("NSRect")))
        {
          if ((objc_msgSend(v6, "isReadOnly") & 1) == 0)
          {
            v19 = objc_msgSend(v6, "propertySetter");
            if (v19)
            {
              v20 = v19;
              v21 = (void (*)(_QWORD, uint64_t, double, double, double, double))objc_msgSend(v6, "propertySetterIMP");
              v21(*(_QWORD *)(a1 + 32), v20, *MEMORY[0x1E0CB3438], *(double *)(MEMORY[0x1E0CB3438] + 8), *(double *)(MEMORY[0x1E0CB3438] + 16), *(double *)(MEMORY[0x1E0CB3438] + 24));
            }
            else
            {
              v28 = (_OWORD *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 32));
              if (v28)
              {
                v29 = *(_OWORD *)(MEMORY[0x1E0CB3438] + 16);
                *v28 = *MEMORY[0x1E0CB3438];
                v28[1] = v29;
              }
            }
          }
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("CGPoint")) & 1) != 0
               || objc_msgSend(v10, "isEqualToString:", CFSTR("NSPoint")))
        {
          if ((objc_msgSend(v6, "isReadOnly") & 1) == 0)
          {
            v25 = objc_msgSend(v6, "propertySetter");
            if (v25)
            {
              v26 = v25;
              v27 = (void (*)(_QWORD, uint64_t, double, double))objc_msgSend(v6, "propertySetterIMP");
              v27(*(_QWORD *)(a1 + 32), v26, *MEMORY[0x1E0CB3430], *(double *)(MEMORY[0x1E0CB3430] + 8));
            }
            else
            {
              v23 = (_OWORD *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 32));
              if (v23)
              {
                v24 = (_OWORD *)MEMORY[0x1E0CB3430];
                goto LABEL_48;
              }
            }
          }
        }
        else if (!_CPLSilentLogging)
        {
          __CPLCodingOSLogDomain();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = 138412546;
            v32 = v5;
            v33 = 2112;
            v34 = v10;
            _os_log_impl(&dword_1B03C2000, v30, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v31, 0x16u);
          }

        }
LABEL_60:

        break;
    }
  }

}

uint64_t __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke_117(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__NSObject_CPLCodingProxy__cplClearProperties___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  if ((void *)a1[4] != a2)
  {
    v5 = (void *)a1[5];
    v4 = a1[6];
    v6 = a2;
    objc_msgSend(v5, "objectAtIndex:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);

  }
}

void __35__NSObject_CPLCodingProxy__cplHash__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __darwin_ct_rune_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *v17;
  unsigned int v18;
  double v19;
  float v20;
  int v21;
  id v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 48), "cplShouldIgnorePropertyForEquality:", v5) & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1B5E08BF0]();
    v8 = __tolower(objc_msgSend(v6, "propertyType"));
    if (v8 <= 97)
    {
      if (v8 != 35)
      {
        if (v8 == 64)
        {
          ((void (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v13, "cplSpecialHash") ^ v14;

        }
        else
        {
LABEL_10:
          if (!_CPLSilentLogging)
          {
            __CPLCodingOSLogDomain();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v21 = 138412546;
              v22 = v5;
              v23 = 1024;
              v24 = objc_msgSend(v6, "propertyType");
              _os_log_impl(&dword_1B03C2000, v17, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v21, 0x12u);
            }

          }
        }
      }
    }
    else
    {
      switch(v8)
      {
        case 'b':
          v18 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v11 = *(_QWORD *)(v10 + 24);
          v12 = v18;
          goto LABEL_17;
        case 'c':
        case 'i':
        case 's':
          v9 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v11 = *(_QWORD *)(v10 + 24);
          v12 = v9;
          goto LABEL_17;
        case 'd':
          v19 = ((double (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v11 = *(_QWORD *)(v10 + 24);
          v12 = (unint64_t)(v19 * 1000.0);
          goto LABEL_17;
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_10;
        case 'f':
          v20 = ((float (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v11 = *(_QWORD *)(v10 + 24);
          v12 = (unint64_t)(float)(v20 * 1000.0);
LABEL_17:
          v16 = v11 ^ v12;
          goto LABEL_18;
        case 'l':
        case 'q':
          v15 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v16 = *(_QWORD *)(v10 + 24) ^ v15;
LABEL_18:
          *(_QWORD *)(v10 + 24) = v16;
          break;
        default:
          if (v8 != 123)
            goto LABEL_10;
          break;
      }
    }
    objc_autoreleasePoolPop(v7);
  }

}

void __95__NSObject_CPLCodingProxy__cplProperties_areEqualToPropertiesOf_diffTracker_withEqualityBlock___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  __darwin_ct_rune_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  NSObject *v24;
  double v25;
  float v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  BOOL v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  NSObject *v42;
  int v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;
  NSSize v48;
  NSPoint v49;
  NSSize v50;
  NSPoint v51;
  NSRect v52;
  NSRect v53;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = *(void **)(a1 + 32);
  if ((!v9 || objc_msgSend(v9, "containsObject:", v7))
    && (objc_msgSend(*(id *)(a1 + 80), "cplShouldIgnorePropertyForEquality:", v7) & 1) == 0)
  {
    v10 = *(_QWORD *)(a1 + 64);
    if (!v10)
      goto LABEL_7;
    v11 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, id, uint64_t))(v10 + 16))(v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v7, objc_msgSend(v8, "propertyGetter"));
    if (v11 == 1)
    {
LABEL_38:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      objc_msgSend(*(id *)(a1 + 56), "noteObjectsDifferOnProperty:", v7);
      *a4 = *(_BYTE *)(a1 + 88);
      goto LABEL_39;
    }
    if (!v11)
    {
LABEL_7:
      v12 = __tolower(objc_msgSend(v8, "propertyType"));
      if (v12 > 97)
      {
        switch(v12)
        {
          case 'b':
          case 'c':
          case 'i':
          case 's':
            v13 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
            if (v13 != ((unsigned int (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 48), objc_msgSend(v8, "propertyGetter")))goto LABEL_38;
            goto LABEL_39;
          case 'd':
            v25 = ((double (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
            if (v25 != ((double (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 48), objc_msgSend(v8, "propertyGetter")))goto LABEL_38;
            goto LABEL_39;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_23;
          case 'f':
            v26 = ((float (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
            if (v26 != ((float (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 48), objc_msgSend(v8, "propertyGetter")))goto LABEL_38;
            goto LABEL_39;
          case 'l':
          case 'q':
            goto LABEL_17;
          default:
            if (v12 != 123)
              goto LABEL_23;
            objc_msgSend(v8, "structName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v14, "isEqualToString:", CFSTR("CGSize")) & 1) != 0
              || objc_msgSend(v14, "isEqualToString:", CFSTR("NSSize")))
            {
              v19 = ((double (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
              v21 = v20;
              v50.width = ((double (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 48), objc_msgSend(v8, "propertyGetter"));
              v50.height = v22;
              v48.width = v19;
              v48.height = v21;
              v23 = NSEqualSizes(v48, v50);
            }
            else if ((objc_msgSend(v14, "isEqualToString:", CFSTR("CGRect")) & 1) != 0
                   || objc_msgSend(v14, "isEqualToString:", CFSTR("NSRect")))
            {
              v27 = ((double (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
              v29 = v28;
              v31 = v30;
              v33 = v32;
              v53.origin.x = ((double (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 48), objc_msgSend(v8, "propertyGetter"));
              v53.origin.y = v34;
              v53.size.width = v35;
              v53.size.height = v36;
              v52.origin.x = v27;
              v52.origin.y = v29;
              v52.size.width = v31;
              v52.size.height = v33;
              v23 = NSEqualRects(v52, v53);
            }
            else
            {
              if ((objc_msgSend(v14, "isEqualToString:", CFSTR("CGPoint")) & 1) == 0
                && (objc_msgSend(v14, "isEqualToString:", CFSTR("NSPoint")) & 1) == 0)
              {
                if (!_CPLSilentLogging)
                {
                  __CPLCodingOSLogDomain();
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    v43 = 138412546;
                    v44 = v7;
                    v45 = 2112;
                    v46 = v14;
                    _os_log_impl(&dword_1B03C2000, v42, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v43, 0x16u);
                  }

                }
                goto LABEL_32;
              }
              v38 = ((double (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
              v40 = v39;
              v51.x = ((double (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 48), objc_msgSend(v8, "propertyGetter"));
              v51.y = v41;
              v49.x = v38;
              v49.y = v40;
              v23 = NSEqualPoints(v49, v51);
            }
            v37 = v23;

            if (v37)
              goto LABEL_39;
            break;
        }
        goto LABEL_38;
      }
      if (v12 == 35)
      {
LABEL_17:
        v18 = ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
        if (v18 == ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 48), objc_msgSend(v8, "propertyGetter")))goto LABEL_39;
        goto LABEL_38;
      }
      if (v12 == 64)
      {
        ((void (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 40), objc_msgSend(v8, "propertyGetter"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(_QWORD, uint64_t))objc_msgSend(v8, "propertyGetterIMP"))(*(_QWORD *)(a1 + 48), objc_msgSend(v8, "propertyGetter"));
        v15 = objc_claimAutoreleasedReturnValue();
        if (v14 != (void *)v15)
        {
          v16 = (void *)v15;
          if (v15)
          {
            v17 = objc_msgSend(v14, "cplSpecialIsEqual:", v15);

            if ((v17 & 1) != 0)
              goto LABEL_39;
          }
          else
          {

          }
          goto LABEL_38;
        }

LABEL_32:
      }
      else
      {
LABEL_23:
        if (!_CPLSilentLogging)
        {
          __CPLCodingOSLogDomain();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            v43 = 138412546;
            v44 = v7;
            v45 = 1024;
            LODWORD(v46) = objc_msgSend(v8, "propertyType");
            _os_log_impl(&dword_1B03C2000, v24, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v43, 0x12u);
          }

        }
      }
    }
  }
LABEL_39:

}

void __57__NSObject_CPLCodingProxy__cplDecodePropertiesFromCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __darwin_ct_rune_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  _BYTE *v21;
  double v22;
  double v23;
  uint64_t v24;
  float v25;
  float v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  NSString *v30;
  Class v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t *v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double *v46;
  float *v47;
  _DWORD *v48;
  _WORD *v49;
  double *v50;
  double *v51;
  NSObject *v52;
  int v53;
  id v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1B5E08BF0]();
  v8 = __tolower(objc_msgSend(v6, "propertyType"));
  if (v8 > 97)
  {
    switch(v8)
    {
      case 'b':
        v20 = objc_msgSend(*(id *)(a1 + 32), "cplDecodeBoolForKey:", v5);
        goto LABEL_23;
      case 'c':
        v20 = objc_msgSend(*(id *)(a1 + 32), "cplDecodeCharForKey:", v5);
LABEL_23:
        v9 = v20;
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          goto LABEL_57;
        v10 = objc_msgSend(v6, "propertySetter");
        if (v10)
          goto LABEL_5;
        v21 = (_BYTE *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 40));
        if (v21)
          *v21 = v9;
        goto LABEL_57;
      case 'd':
        objc_msgSend(*(id *)(a1 + 32), "decodeDoubleForKey:", v5);
        v23 = v22;
        if ((objc_msgSend(v6, "isReadOnly") & 1) == 0)
        {
          v24 = objc_msgSend(v6, "propertySetter");
          if (v24)
          {
            ((void (*)(_QWORD, uint64_t, double))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 40), v24, v23);
          }
          else
          {
            v46 = (double *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 40));
            if (v46)
              *v46 = v23;
          }
        }
        goto LABEL_57;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_17;
      case 'f':
        objc_msgSend(*(id *)(a1 + 32), "decodeFloatForKey:", v5);
        v26 = v25;
        if ((objc_msgSend(v6, "isReadOnly") & 1) == 0)
        {
          v27 = objc_msgSend(v6, "propertySetter");
          if (v27)
          {
            ((void (*)(_QWORD, uint64_t, float))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 40), v27, v26);
          }
          else
          {
            v47 = (float *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 40));
            if (v47)
              *v47 = v26;
          }
        }
        goto LABEL_57;
      case 'i':
        v9 = objc_msgSend(*(id *)(a1 + 32), "decodeInt32ForKey:", v5);
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          goto LABEL_57;
        v10 = objc_msgSend(v6, "propertySetter");
        if (v10)
          goto LABEL_5;
        v48 = (_DWORD *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 40));
        if (v48)
          *v48 = v9;
        goto LABEL_57;
      case 'l':
      case 'q':
        v9 = objc_msgSend(*(id *)(a1 + 32), "decodeInt64ForKey:", v5);
        if ((objc_msgSend(v6, "isReadOnly") & 1) != 0)
          goto LABEL_57;
        v10 = objc_msgSend(v6, "propertySetter");
        if (v10)
        {
LABEL_5:
          ((void (*)(_QWORD, uint64_t, uint64_t))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 40), v10, v9);
        }
        else
        {
          v34 = (uint64_t *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 40));
          if (v34)
            *v34 = v9;
        }
        goto LABEL_57;
      case 's':
        v28 = objc_msgSend(*(id *)(a1 + 32), "decodeInt32ForKey:", v5);
        if ((objc_msgSend(v6, "isReadOnly") & 1) == 0)
        {
          v29 = objc_msgSend(v6, "propertySetter");
          if (v29)
          {
            ((void (*)(_QWORD, uint64_t, _QWORD))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 40), v29, v28);
          }
          else
          {
            v49 = (_WORD *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 40));
            if (v49)
              *v49 = v28;
          }
        }
        goto LABEL_57;
      default:
        if (v8 != 123)
          goto LABEL_17;
        objc_msgSend(v6, "structName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CGSize")) & 1) != 0
          || objc_msgSend(v13, "isEqualToString:", CFSTR("NSSize")))
        {
          objc_msgSend(*(id *)(a1 + 32), "decodeSizeForKey:", v5);
          goto LABEL_14;
        }
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CGRect")) & 1) != 0
          || objc_msgSend(v13, "isEqualToString:", CFSTR("NSRect")))
        {
          objc_msgSend(*(id *)(a1 + 32), "decodeRectForKey:", v5);
          v38 = v37;
          v40 = v39;
          v42 = v41;
          v44 = v43;
          if ((objc_msgSend(v6, "isReadOnly") & 1) == 0)
          {
            v45 = objc_msgSend(v6, "propertySetter");
            if (v45)
            {
              ((void (*)(_QWORD, uint64_t, double, double, double, double))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 40), v45, v38, v40, v42, v44);
            }
            else
            {
              v51 = (double *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 40));
              if (v51)
              {
                *v51 = v38;
                v51[1] = v40;
                v51[2] = v42;
                v51[3] = v44;
              }
            }
          }
        }
        else
        {
          if ((objc_msgSend(v13, "isEqualToString:", CFSTR("CGPoint")) & 1) != 0
            || objc_msgSend(v13, "isEqualToString:", CFSTR("NSPoint")))
          {
            objc_msgSend(*(id *)(a1 + 32), "decodePointForKey:", v5);
LABEL_14:
            v16 = v14;
            v17 = v15;
            if ((objc_msgSend(v6, "isReadOnly") & 1) == 0)
            {
              v18 = objc_msgSend(v6, "propertySetter");
              if (v18)
              {
                ((void (*)(_QWORD, uint64_t, double, double))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 40), v18, v16, v17);
              }
              else
              {
                v50 = (double *)objc_msgSend(v6, "ivarAddrForObject:", *(_QWORD *)(a1 + 40));
                if (v50)
                {
                  *v50 = v16;
                  v50[1] = v17;
                }
              }
            }
            goto LABEL_54;
          }
          if (!_CPLSilentLogging)
          {
            __CPLCodingOSLogDomain();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              v53 = 138412546;
              v54 = v5;
              v55 = 2112;
              v56 = v13;
              _os_log_impl(&dword_1B03C2000, v52, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v53, 0x16u);
            }

          }
        }
        break;
    }
    goto LABEL_54;
  }
  if (v8 == 35)
  {
    objc_msgSend(*(id *)(a1 + 32), "decodeObjectForKey:", v5);
    v30 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = v30;
    if (v30)
    {
      v31 = NSClassFromString(v30);
      if (v31)
        goto LABEL_46;
      if (!_CPLSilentLogging)
      {
        __CPLCodingOSLogDomain();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v53 = 138412546;
          v54 = v13;
          v55 = 2112;
          v56 = v5;
          _os_log_impl(&dword_1B03C2000, v32, OS_LOG_TYPE_ERROR, "Unable to find class %@ for %@", (uint8_t *)&v53, 0x16u);
        }

      }
    }
    v31 = 0;
LABEL_46:
    v33 = objc_msgSend(v6, "propertySetter");
    if (v33)
      ((void (*)(_QWORD, uint64_t, Class))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 40), v33, v31);
    else
      objc_msgSend(v6, "setIvarValue:forObject:", v31, *(_QWORD *)(a1 + 40));
LABEL_54:

    goto LABEL_57;
  }
  if (v8 == 64)
  {
    objc_msgSend(v6, "propertyClasses");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 32);
    if (v11)
      objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v11, v5);
    else
      objc_msgSend(v12, "decodeObjectForKey:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v6, "propertySetter");
    if (v36)
      ((void (*)(_QWORD, uint64_t, void *))objc_msgSend(v6, "propertySetterIMP"))(*(_QWORD *)(a1 + 40), v36, v35);
    else
      objc_msgSend(v6, "setIvarValue:forObject:", v35, *(_QWORD *)(a1 + 40));

  }
  else
  {
LABEL_17:
    if (!_CPLSilentLogging)
    {
      __CPLCodingOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v53 = 138412546;
        v54 = v5;
        v55 = 1024;
        LODWORD(v56) = objc_msgSend(v6, "propertyType");
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v53, 0x12u);
      }

    }
  }
LABEL_57:
  objc_autoreleasePoolPop(v7);

}

void __57__NSObject_CPLCodingProxy__cplEncodePropertiesWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  __darwin_ct_rune_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1B5E08BF0]();
  v8 = __tolower(objc_msgSend(v6, "propertyType"));
  if (v8 > 97)
  {
    switch(v8)
    {
      case 'b':
        objc_msgSend(*(id *)(a1 + 40), "encodeBool:forKey:", ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter")), v5);
        goto LABEL_24;
      case 'c':
        objc_msgSend(*(id *)(a1 + 40), "encodeInt:forKey:", ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter")), v5);
        goto LABEL_24;
      case 'd':
        ((void (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
        objc_msgSend(*(id *)(a1 + 40), "encodeDouble:forKey:", v5);
        goto LABEL_24;
      case 'e':
      case 'g':
      case 'h':
      case 'j':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
        goto LABEL_13;
      case 'f':
        ((void (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
        objc_msgSend(*(id *)(a1 + 40), "encodeFloat:forKey:", v5);
        goto LABEL_24;
      case 'i':
      case 's':
        objc_msgSend(*(id *)(a1 + 40), "encodeInt32:forKey:", ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter")), v5);
        goto LABEL_24;
      case 'l':
      case 'q':
        objc_msgSend(*(id *)(a1 + 40), "encodeInt64:forKey:", ((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter")), v5);
        goto LABEL_24;
      default:
        if (v8 != 123)
          goto LABEL_13;
        objc_msgSend(v6, "structName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CGSize")) & 1) != 0
          || objc_msgSend(v9, "isEqualToString:", CFSTR("NSSize")))
        {
          ((void (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          objc_msgSend(*(id *)(a1 + 40), "encodeSize:forKey:", v5);
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CGRect")) & 1) != 0
               || objc_msgSend(v9, "isEqualToString:", CFSTR("NSRect")))
        {
          ((void (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          objc_msgSend(*(id *)(a1 + 40), "encodeRect:forKey:", v5);
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CGPoint")) & 1) != 0
               || objc_msgSend(v9, "isEqualToString:", CFSTR("NSPoint")))
        {
          ((void (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
          objc_msgSend(*(id *)(a1 + 40), "encodePoint:forKey:", v5);
        }
        else if (!_CPLSilentLogging)
        {
          __CPLCodingOSLogDomain();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v15 = 138412546;
            v16 = v5;
            v17 = 2112;
            v18 = v9;
            _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Ignoring unknown struct for %@: %@", (uint8_t *)&v15, 0x16u);
          }

        }
        goto LABEL_23;
    }
  }
  if (v8 == 35)
  {
    v12 = (objc_class *)((uint64_t (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
    v13 = *(void **)(a1 + 40);
    NSStringFromClass(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    goto LABEL_22;
  }
  if (v8 == 64)
  {
    ((void (*)(_QWORD, uint64_t))objc_msgSend(v6, "propertyGetterIMP"))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "propertyGetter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "conformsToProtocol:", &unk_1EEEB8DE8))
    {
LABEL_23:

      goto LABEL_24;
    }
    v10 = *(void **)(a1 + 40);
LABEL_22:
    objc_msgSend(v10, "encodeObject:forKey:", v9, v5);
    goto LABEL_23;
  }
LABEL_13:
  if (!_CPLSilentLogging)
  {
    __CPLCodingOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 138412546;
      v16 = v5;
      v17 = 1024;
      LODWORD(v18) = objc_msgSend(v6, "propertyType");
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Ignoring unknown property type for %@: %c", (uint8_t *)&v15, 0x12u);
    }

  }
LABEL_24:
  objc_autoreleasePoolPop(v7);

}

void __47__NSObject_CPLCodingProxy__cplAllPropertyNames__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend((id)cplAllPropertyNames_propertyNamesPerClass, "objectForKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "_cplPropertyAttributeMap");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v10, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "initWithArray:", v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend((id)cplAllPropertyNames_propertyNamesPerClass, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  }
}

void __47__NSObject_CPLCodingProxy__cplAllPropertyNames__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("cpl.record.coding.properties", 0);
  v1 = (void *)cplAllPropertyNames_lock;
  cplAllPropertyNames_lock = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)cplAllPropertyNames_propertyNamesPerClass;
  cplAllPropertyNames_propertyNamesPerClass = v2;

}

void __52__NSObject_CPLCodingProxy___cplPropertyAttributeMap__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  objc_msgSend((id)_cplPropertyAttributeMap_propertyMapPerClass, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 40), "_addPropertyAttributeMapToPropertyMapLocked:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    objc_msgSend((id)_cplPropertyAttributeMap_propertyMapPerClass, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(_QWORD *)(a1 + 40));
  }
}

void __52__NSObject_CPLCodingProxy___cplPropertyAttributeMap__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = dispatch_queue_create("cpl.record.coding", 0);
  v1 = (void *)_cplPropertyAttributeMap_lock;
  _cplPropertyAttributeMap_lock = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_cplPropertyAttributeMap_propertyMapPerClass;
  _cplPropertyAttributeMap_propertyMapPerClass = v2;

}

void __61__NSObject_CPLCodingProxy__cplShouldIgnorePropertyForCoding___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("description"), CFSTR("debugDescription"), CFSTR("hash"), CFSTR("superclass"), 0);
  v1 = (void *)cplShouldIgnorePropertyForCoding__baseIgnorableProperties;
  cplShouldIgnorePropertyForCoding__baseIgnorableProperties = v0;

}

@end
