@implementation _GCHapticParameterCurve

- (_GCHapticParameterCurve)initWithHapticCommand:(const void *)a3
{
  _GCHapticParameterCurve *v4;
  uint64_t v5;
  NSMutableArray *curve;
  __int128 v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  float *v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSMutableArray *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  __int128 v25;
  unsigned int v26[2];
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v31.receiver = self;
  v31.super_class = (Class)_GCHapticParameterCurve;
  v4 = -[_GCHapticParameterCurve init](&v31, sel_init);
  if (!v4)
    return v4;
  +[NSMutableArray array](&off_254DEBB20, "array");
  v5 = objc_claimAutoreleasedReturnValue();
  curve = v4->_curve;
  v4->_curve = (NSMutableArray *)v5;

  v8 = *((_DWORD *)a3 + 8);
  v9 = *((_DWORD *)a3 + 6);
  v10 = *((_DWORD *)a3 + 4);
  if (v9 <= 1019)
  {
    v11 = 5000;
    switch(v9)
    {
      case 1000:
        goto LABEL_25;
      case 1001:
        v11 = 5001;
        break;
      case 1010:
        v11 = 73;
        break;
      case 1011:
        v11 = 75;
        break;
      case 1012:
        v11 = 72;
        break;
      case 1013:
        v11 = 5004;
        break;
      case 1015:
        v11 = 5011;
        break;
      default:
        goto LABEL_15;
    }
    goto LABEL_25;
  }
  v11 = 0;
  if (v9 <= 2009)
  {
    switch(v9)
    {
      case 1020:
        goto LABEL_25;
      case 2000:
        v11 = 5002;
        goto LABEL_25;
      case 2001:
        v11 = 5003;
        goto LABEL_25;
    }
LABEL_15:
    v11 = *((_DWORD *)a3 + 6);
    if (v9 > 0xFF)
      v11 = 0;
    goto LABEL_25;
  }
  if (v9 > 2011)
  {
    if (v9 == 2012)
    {
      v11 = 81;
      goto LABEL_25;
    }
    if (v9 == 2020)
      goto LABEL_25;
    goto LABEL_15;
  }
  if (v9 == 2010)
    v11 = 79;
  else
    v11 = 80;
LABEL_25:
  v12 = (v8 - 1);
  if (v8 != 1)
  {
    v13 = (float *)((char *)a3 + 48);
    *(_QWORD *)&v7 = 138412290;
    v25 = v7;
    do
    {
      v14 = *(v13 - 2);
      v15 = *((double *)a3 + 1);
      v16 = v15 + *(v13 - 3);
      v17 = v15 + *(v13 - 1);
      v26[0] = v10;
      v26[1] = v11;
      v27 = v16;
      v28 = v17;
      v18 = v14;
      v19 = *v13;
      v29 = v18;
      v30 = v19;
      if (gc_isInternalBuild())
      {
        getGCHapticsLogger();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          hapticParamCurveSegmentToString(v26);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v25;
          v33 = v23;
          _os_log_impl(&dword_215181000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

        }
      }
      v20 = v4->_curve;
      +[NSValue valueWithBytes:objCType:](&off_254DE3D80, "valueWithBytes:objCType:", v26, "{?=II{?=dddd}}", v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v20, "addObject:", v21);

      v13 += 2;
      --v12;
    }
    while (v12);
  }
  return v4;
}

- (NSMutableArray)curve
{
  return self->_curve;
}

- (void)setCurve:(id)a3
{
  objc_storeStrong((id *)&self->_curve, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curve, 0);
}

@end
