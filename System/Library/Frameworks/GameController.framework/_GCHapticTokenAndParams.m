@implementation _GCHapticTokenAndParams

- (_GCHapticTokenAndParams)initWithHapticCommand:(const void *)a3
{
  _GCHapticTokenAndParams *v4;
  uint64_t v5;
  NSMutableArray *params;
  __int128 v7;
  __int128 v8;
  char *v9;
  uint64_t v10;
  _DWORD *v11;
  int v12;
  uint64_t v13;
  NSMutableArray *v14;
  FixedParameter *v15;
  double v16;
  FixedParameter *v17;
  _OWORD v19[4];
  int v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_GCHapticTokenAndParams;
  v4 = -[_GCHapticTokenAndParams init](&v21, sel_init);
  if (v4)
  {
    +[NSMutableArray array](&off_254DEBB20, "array");
    v5 = objc_claimAutoreleasedReturnValue();
    params = v4->_params;
    v4->_params = (NSMutableArray *)v5;

    v4->_token = *((_QWORD *)a3 + 4);
    v7 = *(_OWORD *)((char *)a3 + 56);
    v19[0] = *(_OWORD *)((char *)a3 + 40);
    v19[1] = v7;
    v8 = *(_OWORD *)((char *)a3 + 88);
    v19[2] = *(_OWORD *)((char *)a3 + 72);
    v19[3] = v8;
    v20 = *((_DWORD *)a3 + 26);
    v9 = (char *)v19 + 4;
    if (!LODWORD(v19[0]))
      v9 = 0;
    v10 = LODWORD(v19[0]) >= 8 ? 8 : LODWORD(v19[0]);
    if ((_DWORD)v10)
    {
      v11 = v9 + 4;
      do
      {
        v12 = *(v11 - 1);
        v13 = 330;
        if (v12 <= 1999)
        {
          switch(v12)
          {
            case 1000:
              goto LABEL_23;
            case 1001:
              goto LABEL_19;
            case 1010:
              goto LABEL_20;
            case 1011:
              goto LABEL_21;
            case 1012:
              goto LABEL_16;
            case 1013:
              v13 = 336;
              goto LABEL_23;
            case 1015:
              v13 = 332;
              goto LABEL_23;
            default:
              goto LABEL_24;
          }
          goto LABEL_24;
        }
        if (v12 <= 2009)
        {
          if (v12 == 2000)
            goto LABEL_23;
          if (v12 == 2001)
          {
LABEL_19:
            v13 = 331;
            goto LABEL_23;
          }
        }
        else
        {
          switch(v12)
          {
            case 2010:
LABEL_20:
              v13 = 333;
              goto LABEL_23;
            case 2011:
LABEL_21:
              v13 = 334;
              goto LABEL_23;
            case 2012:
LABEL_16:
              v13 = 335;
LABEL_23:
              v14 = v4->_params;
              v15 = [FixedParameter alloc];
              LODWORD(v16) = *v11;
              v17 = -[FixedParameter initWithIdentifier:value:](v15, "initWithIdentifier:value:", v13, v16);
              -[NSMutableArray addObject:](v14, "addObject:", v17);

              break;
          }
        }
LABEL_24:
        v11 += 2;
        --v10;
      }
      while (v10);
    }
  }
  return v4;
}

- (NSMutableArray)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
  objc_storeStrong((id *)&self->_params, a3);
}

- (unint64_t)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
}

@end
