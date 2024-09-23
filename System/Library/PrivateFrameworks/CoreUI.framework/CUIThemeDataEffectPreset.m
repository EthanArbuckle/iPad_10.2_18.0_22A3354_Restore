@implementation CUIThemeDataEffectPreset

- (CUIThemeDataEffectPreset)initWithEffectData:(const _cuieffectdata *)a3 forScaleFactor:(double)a4
{
  CUIThemeDataEffectPreset *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CUIThemeDataEffectPreset *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t var0;
  void *v21;
  unsigned int *var1;
  unsigned int *v23;
  unsigned int *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  float *v28;
  uint64_t v29;
  unint64_t v30;
  double v31;
  uint64_t v33;
  SEL v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)CUIThemeDataEffectPreset;
  v7 = -[CUIShapeEffectPreset init](&v35, sel_init);
  v14 = v7;
  if (a3 && a3->var0 == 1129596504)
  {
    v34 = a2;
    -[CUIShapeEffectPreset setScaleFactor:]((uint64_t)v7, a4);
    var0 = a3->var4.var0;
    if ((_DWORD)var0)
    {
      v21 = 0;
      var1 = a3->var4.var1;
      v23 = &a3->var4.var1[var0 + 1];
      v24 = &a3->var4.var1[var0 + 4];
      do
      {
        v25 = var1[(_QWORD)v21];
        v26 = (char *)v23 + v25;
        if (*(unsigned int *)((char *)v23 + v25 + 4))
        {
          v27 = 0;
          v28 = (float *)((char *)v24 + v25);
          while (2)
          {
            v29 = *((unsigned int *)v28 - 1);
            switch((int)v29)
            {
              case 0:
              case 1:
                v30 = *(unsigned __int16 *)v28 | ((unint64_t)*((unsigned __int8 *)v28 + 2) << 16);
                goto LABEL_14;
              case 2:
              case 3:
                v31 = *v28;
                goto LABEL_15;
              case 4:
              case 5:
              case 7:
              case 8:
              case 9:
              case 10:
              case 11:
                v30 = *(unsigned int *)v28;
                goto LABEL_14;
              case 6:
                v30 = *(unsigned __int16 *)v28;
LABEL_14:
                v31 = *(double *)&v30;
                goto LABEL_15;
              default:
                v31 = 0.0;
                if (v29 < 0xC)
LABEL_15:
                  -[CUIShapeEffectPreset addValue:forParameter:withEffectType:atEffectIndex:](v14, "addValue:forParameter:withEffectType:atEffectIndex:", *(_QWORD *)&v31);
                else
                  _CUILog(4, (uint64_t)"Unrecognized effect parameter type %d encountered for effect type %u. Skipping.", v15, v29, v16, v17, v18, v19, *((unsigned int *)v28 - 1));
                v28 += 2;
                if (++v27 >= (unint64_t)*((unsigned int *)v26 + 1))
                  break;
                continue;
            }
            break;
          }
        }
        v21 = (char *)v21 + 1;
      }
      while (v21 != (void *)var0);
    }
    if (-[CUIShapeEffectPreset effectCount](v14, "effectCount") != var0)
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v34, v14, CFSTR("CUIThemeDataEffectPreset.m"), 175, CFSTR("Preset effect count does not match serialized effect count"));
  }
  else
  {
    _CUILog(4, (uint64_t)"Invalid effect data signature", v8, v9, v10, v11, v12, v13, v33);

    return 0;
  }
  return v14;
}

- (id)description
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(self, a2);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p> "), NSStringFromClass(v3), self);
}

@end
