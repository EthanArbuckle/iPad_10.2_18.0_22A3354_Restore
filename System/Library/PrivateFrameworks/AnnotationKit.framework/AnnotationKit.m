id sub_228FC1AF0(double a1, double a2, double a3, double a4)
{
  _QWORD v5[4];

  *(double *)v5 = a1;
  *(double *)&v5[1] = a2;
  *(double *)&v5[2] = a3;
  *(double *)&v5[3] = a4;
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v5, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  return (id)objc_claimAutoreleasedReturnValue();
}

double sub_228FC1B2C(void *a1)
{
  double v2;

  objc_msgSend(a1, "getValue:size:", &v2, 32);
  return v2;
}

id sub_228FC7A38(uint64_t a1, uint64_t a2, const CGPath *a3)
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    CGPathApply(a3, v4, (CGPathApplierFunction)sub_228FC7A84);
  return v4;
}

void sub_228FC7A84(void *a1, int *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t i;
  float v8;
  float v9;
  float v10;
  float v11;
  unsigned int v12;
  int v13;

  v3 = a1;
  v4 = v3;
  v5 = *a2;
  v13 = v5;
  if (v5 > 4)
  {
    NSLog(CFSTR("%s: Skipping encoding of path element with type %d"), "void _encodePathElementIntoData(void *, const CGPathElement *)", v5);
  }
  else
  {
    v12 = dword_229092790[v5];
    objc_msgSend(v3, "appendBytes:length:", &v13, 4);
    objc_msgSend(v4, "appendBytes:length:", &v12, 4);
    if (v12)
    {
      v6 = 0;
      for (i = 0; i < v12; ++i)
      {
        v8 = *(double *)(*((_QWORD *)a2 + 1) + v6);
        v11 = v8;
        objc_msgSend(v4, "appendBytes:length:", &v11, 4);
        v9 = *(double *)(*((_QWORD *)a2 + 1) + v6 + 8);
        v10 = v9;
        objc_msgSend(v4, "appendBytes:length:", &v10, 4);
        v6 += 16;
      }
    }
  }

}

CGPath *sub_228FC7B80(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  unint64_t v4;
  CGPath *Mutable;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  float64x2_t *v13;
  __int128 v15;
  __int128 v16;
  CGFloat v17[3];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
LABEL_24:
    Mutable = 0;
    goto LABEL_25;
  }
  v4 = objc_msgSend(v3, "length");
  Mutable = CGPathCreateMutable();
  v6 = objc_msgSend(objc_retainAutorelease(v3), "bytes");
  v15 = *MEMORY[0x24BDBEFB0];
  v16 = v15;
  *(_OWORD *)v17 = v15;
  if (v4 >= 8)
  {
    v7 = v6;
    v8 = 0;
    v9 = 8;
    v10 = CFSTR("%s: Unknown element type for path. Aborting read due to data corruption.");
    while (1)
    {
      v11 = *(int *)(v7 + v8);
      if (v11 > 4)
        break;
      v12 = *(unsigned int *)(v7 + v8 + 4);
      if (dword_229092790[v11] != (_DWORD)v12)
      {
        NSLog(CFSTR("%s: Unexpected point count. Aborting read due to data corruption."), "+[NSData(CGPathExtensions) newCGPathDecodedFromData:]");
        goto LABEL_23;
      }
      if (v9 + 8 * v12 > v4)
      {
        v10 = CFSTR("%s: Number of points left to read exceeds buffer length. Aborting read due to data corruption.");
        break;
      }
      if ((_DWORD)v12)
      {
        v13 = (float64x2_t *)&v15;
        do
        {
          v8 = v9 + 8;
          *v13++ = vcvtq_f64_f32(*(float32x2_t *)(v7 + v9));
          v9 += 8;
          --v12;
        }
        while (v12);
      }
      else
      {
        v8 = v9;
      }
      switch((int)v11)
      {
        case 0:
          CGPathMoveToPoint(Mutable, 0, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1));
          break;
        case 1:
          CGPathAddLineToPoint(Mutable, 0, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1));
          break;
        case 2:
          CGPathAddQuadCurveToPoint(Mutable, 0, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1), *(CGFloat *)&v16, *((CGFloat *)&v16 + 1));
          break;
        case 3:
          CGPathAddCurveToPoint(Mutable, 0, *(CGFloat *)&v15, *((CGFloat *)&v15 + 1), *(CGFloat *)&v16, *((CGFloat *)&v16 + 1), v17[0], v17[1]);
          break;
        case 4:
          CGPathCloseSubpath(Mutable);
          break;
        default:
          break;
      }
      v9 = v8 + 8;
      if (v8 + 8 > v4)
        goto LABEL_25;
    }
    NSLog(&v10->isa, "+[NSData(CGPathExtensions) newCGPathDecodedFromData:]");
LABEL_23:
    CGPathRelease(Mutable);
    goto LABEL_24;
  }
LABEL_25:

  return Mutable;
}

id AKQuadrilateralCreateDictionaryRepresentation(double *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[4];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v24[0] = CFSTR("bottomLeft");
  v22[0] = CFSTR("X");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("Y");
  v23[0] = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[1]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v24[1] = CFSTR("topLeft");
  v20[0] = CFSTR("X");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[2]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("Y");
  v21[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[3]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v3;
  v24[2] = CFSTR("topRight");
  v18[0] = CFSTR("X");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = CFSTR("Y");
  v19[0] = v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[5]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v6;
  v24[3] = CFSTR("bottomRight");
  v16[0] = CFSTR("X");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("Y");
  v17[0] = v7;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1[7]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void AKQuadrilateralMakeWithDictionaryRepresentation(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  v3 = a1;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bottomLeft"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("X"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  *(_QWORD *)a2 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  *(_QWORD *)(a2 + 8) = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topLeft"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("X"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  *(_QWORD *)(a2 + 16) = v11;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Y"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  *(_QWORD *)(a2 + 24) = v13;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topRight"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("X"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  *(_QWORD *)(a2 + 32) = v16;

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Y"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  *(_QWORD *)(a2 + 40) = v18;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("bottomRight"));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("X"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  *(_QWORD *)(a2 + 48) = v20;

  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("Y"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  *(_QWORD *)(a2 + 56) = v22;

}

uint64_t sub_228FC9748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", a3, "{AKQuadrilateral={CGPoint=dd}{CGPoint=dd}{CGPoint=dd}{CGPoint=dd}}");
}

const char *sub_228FC975C@<X0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  id v3;
  const char *result;
  NSUInteger v5;
  NSUInteger sizep;

  sizep = 0;
  v3 = objc_retainAutorelease(a1);
  result = NSGetSizeAndAlignment((const char *)objc_msgSend(v3, "objCType"), &sizep, 0);
  v5 = sizep;
  *a2 = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  a2[3] = 0u;
  if (v5 == 64)
    return (const char *)objc_msgSend(v3, "getValue:size:", a2, 64);
  return result;
}

id sub_228FC97C4()
{
  return +[AKSecureSerializationHelper encodeColor:](AKSecureSerializationHelper, "encodeColor:");
}

void sub_228FC97D0(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  +[AKSecureSerializationHelper encodeColor:](AKSecureSerializationHelper, "encodeColor:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v7, v6);

}

id sub_228FC983C(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKSecureSerializationHelper decodeColor:](AKSecureSerializationHelper, "decodeColor:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id sub_228FC9880()
{
  return +[AKSecureSerializationHelper encodeFont:](AKSecureSerializationHelper, "encodeFont:");
}

void sub_228FC988C(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  +[AKSecureSerializationHelper encodeFont:](AKSecureSerializationHelper, "encodeFont:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v7, v6);

}

id sub_228FC98F8(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKSecureSerializationHelper decodeFont:](AKSecureSerializationHelper, "decodeFont:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id sub_228FC993C()
{
  return +[AKSecureSerializationHelper encodeTextAttributes:](AKSecureSerializationHelper, "encodeTextAttributes:");
}

void sub_228FC9948(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  +[AKSecureSerializationHelper encodeTextAttributes:](AKSecureSerializationHelper, "encodeTextAttributes:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v7, v6);

}

id sub_228FC99B4(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dataForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKSecureSerializationHelper decodeTextAttributes:](AKSecureSerializationHelper, "decodeTextAttributes:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

double sub_228FCB5F4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v11 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  v6 = 0.0;
  v4 = a3;
  objc_msgSend(a1, "getL:a:b:", &v11, &v10, &v9);
  objc_msgSend(v4, "getL:a:b:", &v8, &v7, &v6);

  return sqrt((v8 - v11) * (v8 - v11) + (v7 - v10) * (v7 - v10) + (v6 - v9) * (v6 - v9));
}

void sub_228FCB698(void *a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v9;
  CGColorSpace *v10;
  id v11;
  uint64_t v12;
  CGColor *v13;
  size_t v14;
  uint64_t v15;
  _QWORD *v16;
  const CGFloat *Components;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  if (a5)
    *a5 = 0;
  v9 = objc_msgSend((id)objc_opt_class(), "_getCIELABColorSpace");
  if (v9)
  {
    v10 = (CGColorSpace *)v9;
    block = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = sub_228FCB858;
    v21 = &unk_24F1A72B8;
    v22 = v9;
    if (qword_255A25F58 != -1)
      dispatch_once(&qword_255A25F58, &block);
    if (qword_255A25F50)
    {
      v11 = objc_retainAutorelease(a1);
      objc_msgSend(v11, "CGColor", block, v19, v20, v21, v22, v23);
      v12 = CGColorTransformConvertColor();
      if (v12)
      {
        v13 = (CGColor *)v12;
        v14 = 8 * CGColorSpaceGetNumberOfComponents(v10) + 8;
        MEMORY[0x24BDAC7A8]();
        v16 = (uint64_t *)((char *)&block - ((v15 + 23) & 0xFFFFFFFFFFFFFFF0));
        Components = CGColorGetComponents(v13);
        memcpy(v16, Components, v14);
        if (a3)
          *a3 = *v16;
        if (a4)
          *a4 = v16[1];
        if (a5)
          *a5 = v16[2];
        CFRelease(v13);
      }
    }
  }
}

uint64_t sub_228FCB858(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x22E2C05EC](*(_QWORD *)(a1 + 32), 0);
  qword_255A25F50 = result;
  return result;
}

uint64_t sub_228FCB87C()
{
  if (qword_255A25F68 != -1)
    dispatch_once(&qword_255A25F68, &unk_24F1A70B8);
  return qword_255A25F60;
}

CGColorSpaceRef sub_228FCB8BC()
{
  CGColorSpaceRef result;
  _OWORD v1[2];
  CGFloat blackPoint[3];
  CGFloat whitePoint[2];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)whitePoint = xmmword_2290927E8;
  v4 = 0x3FF16BD900000000;
  memset(blackPoint, 0, sizeof(blackPoint));
  v1[0] = xmmword_229092800;
  v1[1] = unk_229092810;
  result = CGColorSpaceCreateLab(whitePoint, blackPoint, (const CGFloat *)v1);
  qword_255A25F60 = (uint64_t)result;
  return result;
}

id sub_228FCC3BC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("a"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "floatValue");
      v8 = v7;
    }
    else
    {
      v8 = 1.0;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("w"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "intValue");
      objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", (double)v12 / 255.0, (double)v12 / 255.0, (double)v12 / 255.0, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "objectForKey:", CFSTR("r"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = 0.0;
      v16 = 0.0;
      if (v13)
        v16 = (double)(int)objc_msgSend(v13, "intValue") / 255.0;
      objc_msgSend(v4, "objectForKey:", CFSTR("g"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
        v15 = (double)(int)objc_msgSend(v17, "intValue") / 255.0;
      objc_msgSend(v4, "objectForKey:", CFSTR("b"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
        v21 = (double)(int)objc_msgSend(v19, "intValue") / 255.0;
      else
        v21 = 0.0;
      objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", v16, v15, v21, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void sub_228FCC5C0()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("AKAnnotationTheme"), CFSTR("plist"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v3);
  v2 = (void *)qword_255A25F78;
  qword_255A25F78 = v1;

}

void sub_228FCCA84(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A25F88;
  qword_255A25F88 = v1;

}

void sub_228FCCAD8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A25F98;
  qword_255A25F98 = v1;

}

void sub_228FCCB2C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A25FA8;
  qword_255A25FA8 = v1;

}

void sub_228FCCB80(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A25FB8;
  qword_255A25FB8 = v1;

}

void sub_228FCCBD4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A25FC8;
  qword_255A25FC8 = v1;

}

void sub_228FCCE98(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A25FD8;
  qword_255A25FD8 = v1;

}

void sub_228FCCEEC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A25FE8;
  qword_255A25FE8 = v1;

}

void sub_228FCCF40(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A25FF8;
  qword_255A25FF8 = v1;

}

void sub_228FCCF94(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26008;
  qword_255A26008 = v1;

}

void sub_228FCCFE8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26018;
  qword_255A26018 = v1;

}

void sub_228FCD2AC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26028;
  qword_255A26028 = v1;

}

void sub_228FCD300(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26038;
  qword_255A26038 = v1;

}

void sub_228FCD354(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26048;
  qword_255A26048 = v1;

}

void sub_228FCD3A8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26058;
  qword_255A26058 = v1;

}

void sub_228FCD3FC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26068;
  qword_255A26068 = v1;

}

void sub_228FCD6C0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26078;
  qword_255A26078 = v1;

}

void sub_228FCD714(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26088;
  qword_255A26088 = v1;

}

void sub_228FCD768(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26098;
  qword_255A26098 = v1;

}

void sub_228FCD7BC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A260A8;
  qword_255A260A8 = v1;

}

void sub_228FCD810(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A260B8;
  qword_255A260B8 = v1;

}

void sub_228FCDAD4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A260C8;
  qword_255A260C8 = v1;

}

void sub_228FCDB28(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A260D8;
  qword_255A260D8 = v1;

}

void sub_228FCDB7C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A260E8;
  qword_255A260E8 = v1;

}

void sub_228FCDBD0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A260F8;
  qword_255A260F8 = v1;

}

void sub_228FCDC24(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26108;
  qword_255A26108 = v1;

}

void sub_228FCDEE8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26118;
  qword_255A26118 = v1;

}

void sub_228FCDF3C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26128;
  qword_255A26128 = v1;

}

void sub_228FCDF90(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26138;
  qword_255A26138 = v1;

}

void sub_228FCDFE4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26148;
  qword_255A26148 = v1;

}

void sub_228FCE038(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26158;
  qword_255A26158 = v1;

}

void sub_228FCE2FC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26168;
  qword_255A26168 = v1;

}

void sub_228FCE350(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26178;
  qword_255A26178 = v1;

}

void sub_228FCE3A4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26188;
  qword_255A26188 = v1;

}

void sub_228FCE3F8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26198;
  qword_255A26198 = v1;

}

void sub_228FCE44C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A261A8;
  qword_255A261A8 = v1;

}

void sub_228FCE514(uint64_t a1)
{
  id v1;

  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("is_underline"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_255A261B8 = objc_msgSend(v1, "BOOLValue");

}

void sub_228FCE7E8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A261C8;
  qword_255A261C8 = v1;

}

void sub_228FCE83C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A261D8;
  qword_255A261D8 = v1;

}

void sub_228FCE890(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A261E8;
  qword_255A261E8 = v1;

}

void sub_228FCE8E4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A261F8;
  qword_255A261F8 = v1;

}

void sub_228FCE938(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26208;
  qword_255A26208 = v1;

}

void sub_228FCEBFC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26218;
  qword_255A26218 = v1;

}

void sub_228FCEC50(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26228;
  qword_255A26228 = v1;

}

void sub_228FCECA4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26238;
  qword_255A26238 = v1;

}

void sub_228FCECF8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26248;
  qword_255A26248 = v1;

}

void sub_228FCED4C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26258;
  qword_255A26258 = v1;

}

void sub_228FCF010(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26268;
  qword_255A26268 = v1;

}

void sub_228FCF064(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26278;
  qword_255A26278 = v1;

}

void sub_228FCF0B8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26288;
  qword_255A26288 = v1;

}

void sub_228FCF10C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26298;
  qword_255A26298 = v1;

}

void sub_228FCF160(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A262A8;
  qword_255A262A8 = v1;

}

void sub_228FCF424(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A262B8;
  qword_255A262B8 = v1;

}

void sub_228FCF478(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A262C8;
  qword_255A262C8 = v1;

}

void sub_228FCF4CC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A262D8;
  qword_255A262D8 = v1;

}

void sub_228FCF520(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A262E8;
  qword_255A262E8 = v1;

}

void sub_228FCF574(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A262F8;
  qword_255A262F8 = v1;

}

void sub_228FCF838(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26308;
  qword_255A26308 = v1;

}

void sub_228FCF88C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26318;
  qword_255A26318 = v1;

}

void sub_228FCF8E0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26328;
  qword_255A26328 = v1;

}

void sub_228FCF934(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26338;
  qword_255A26338 = v1;

}

void sub_228FCF988(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26348;
  qword_255A26348 = v1;

}

void sub_228FCFC4C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26358;
  qword_255A26358 = v1;

}

void sub_228FCFCA0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26368;
  qword_255A26368 = v1;

}

void sub_228FCFCF4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26378;
  qword_255A26378 = v1;

}

void sub_228FCFD48(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26388;
  qword_255A26388 = v1;

}

void sub_228FCFD9C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26398;
  qword_255A26398 = v1;

}

void sub_228FD0060(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A263A8;
  qword_255A263A8 = v1;

}

void sub_228FD00B4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A263B8;
  qword_255A263B8 = v1;

}

void sub_228FD0108(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A263C8;
  qword_255A263C8 = v1;

}

void sub_228FD015C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A263D8;
  qword_255A263D8 = v1;

}

void sub_228FD01B0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A263E8;
  qword_255A263E8 = v1;

}

void sub_228FD0278(uint64_t a1)
{
  id v1;

  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("is_underline"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_255A263F8 = objc_msgSend(v1, "BOOLValue");

}

void sub_228FD054C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26408;
  qword_255A26408 = v1;

}

void sub_228FD05A0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26418;
  qword_255A26418 = v1;

}

void sub_228FD05F4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26428;
  qword_255A26428 = v1;

}

void sub_228FD0648(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26438;
  qword_255A26438 = v1;

}

void sub_228FD069C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26448;
  qword_255A26448 = v1;

}

void sub_228FD0960(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26458;
  qword_255A26458 = v1;

}

void sub_228FD09B4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26468;
  qword_255A26468 = v1;

}

void sub_228FD0A08(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26478;
  qword_255A26478 = v1;

}

void sub_228FD0A5C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26488;
  qword_255A26488 = v1;

}

void sub_228FD0AB0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26498;
  qword_255A26498 = v1;

}

void sub_228FD0D74(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A264A8;
  qword_255A264A8 = v1;

}

void sub_228FD0DC8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A264B8;
  qword_255A264B8 = v1;

}

void sub_228FD0E1C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A264C8;
  qword_255A264C8 = v1;

}

void sub_228FD0E70(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A264D8;
  qword_255A264D8 = v1;

}

void sub_228FD0EC4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A264E8;
  qword_255A264E8 = v1;

}

void sub_228FD1188(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A264F8;
  qword_255A264F8 = v1;

}

void sub_228FD11DC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26508;
  qword_255A26508 = v1;

}

void sub_228FD1230(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26518;
  qword_255A26518 = v1;

}

void sub_228FD1284(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26528;
  qword_255A26528 = v1;

}

void sub_228FD12D8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26538;
  qword_255A26538 = v1;

}

void sub_228FD159C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26548;
  qword_255A26548 = v1;

}

void sub_228FD15F0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26558;
  qword_255A26558 = v1;

}

void sub_228FD1644(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26568;
  qword_255A26568 = v1;

}

void sub_228FD1698(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26578;
  qword_255A26578 = v1;

}

void sub_228FD16EC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26588;
  qword_255A26588 = v1;

}

void sub_228FD19B0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26598;
  qword_255A26598 = v1;

}

void sub_228FD1A04(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A265A8;
  qword_255A265A8 = v1;

}

void sub_228FD1A58(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A265B8;
  qword_255A265B8 = v1;

}

void sub_228FD1AAC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A265C8;
  qword_255A265C8 = v1;

}

void sub_228FD1B00(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A265D8;
  qword_255A265D8 = v1;

}

void sub_228FD1DC4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A265E8;
  qword_255A265E8 = v1;

}

void sub_228FD1E18(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A265F8;
  qword_255A265F8 = v1;

}

void sub_228FD1E6C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26608;
  qword_255A26608 = v1;

}

void sub_228FD1EC0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26618;
  qword_255A26618 = v1;

}

void sub_228FD1F14(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26628;
  qword_255A26628 = v1;

}

void sub_228FD1FDC(uint64_t a1)
{
  id v1;

  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("is_underline"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_255A26638 = objc_msgSend(v1, "BOOLValue");

}

void sub_228FD22B0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26648;
  qword_255A26648 = v1;

}

void sub_228FD2304(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26658;
  qword_255A26658 = v1;

}

void sub_228FD2358(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26668;
  qword_255A26668 = v1;

}

void sub_228FD23AC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26678;
  qword_255A26678 = v1;

}

void sub_228FD2400(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26688;
  qword_255A26688 = v1;

}

void sub_228FD26C4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26698;
  qword_255A26698 = v1;

}

void sub_228FD2718(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A266A8;
  qword_255A266A8 = v1;

}

void sub_228FD276C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A266B8;
  qword_255A266B8 = v1;

}

void sub_228FD27C0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A266C8;
  qword_255A266C8 = v1;

}

void sub_228FD2814(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A266D8;
  qword_255A266D8 = v1;

}

void sub_228FD2AD8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A266E8;
  qword_255A266E8 = v1;

}

void sub_228FD2B2C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A266F8;
  qword_255A266F8 = v1;

}

void sub_228FD2B80(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26708;
  qword_255A26708 = v1;

}

void sub_228FD2BD4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26718;
  qword_255A26718 = v1;

}

void sub_228FD2C28(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26728;
  qword_255A26728 = v1;

}

void sub_228FD2EEC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26738;
  qword_255A26738 = v1;

}

void sub_228FD2F40(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26748;
  qword_255A26748 = v1;

}

void sub_228FD2F94(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26758;
  qword_255A26758 = v1;

}

void sub_228FD2FE8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26768;
  qword_255A26768 = v1;

}

void sub_228FD303C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26778;
  qword_255A26778 = v1;

}

void sub_228FD3300(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26788;
  qword_255A26788 = v1;

}

void sub_228FD3354(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26798;
  qword_255A26798 = v1;

}

void sub_228FD33A8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A267A8;
  qword_255A267A8 = v1;

}

void sub_228FD33FC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A267B8;
  qword_255A267B8 = v1;

}

void sub_228FD3450(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A267C8;
  qword_255A267C8 = v1;

}

void sub_228FD3714(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A267D8;
  qword_255A267D8 = v1;

}

void sub_228FD3768(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A267E8;
  qword_255A267E8 = v1;

}

void sub_228FD37BC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A267F8;
  qword_255A267F8 = v1;

}

void sub_228FD3810(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26808;
  qword_255A26808 = v1;

}

void sub_228FD3864(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26818;
  qword_255A26818 = v1;

}

void sub_228FD3B28(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26828;
  qword_255A26828 = v1;

}

void sub_228FD3B7C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26838;
  qword_255A26838 = v1;

}

void sub_228FD3BD0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26848;
  qword_255A26848 = v1;

}

void sub_228FD3C24(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26858;
  qword_255A26858 = v1;

}

void sub_228FD3C78(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26868;
  qword_255A26868 = v1;

}

void sub_228FD3D40(uint64_t a1)
{
  id v1;

  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("is_underline"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_255A26878 = objc_msgSend(v1, "BOOLValue");

}

void sub_228FD4014(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26888;
  qword_255A26888 = v1;

}

void sub_228FD4068(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26898;
  qword_255A26898 = v1;

}

void sub_228FD40BC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A268A8;
  qword_255A268A8 = v1;

}

void sub_228FD4110(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A268B8;
  qword_255A268B8 = v1;

}

void sub_228FD4164(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A268C8;
  qword_255A268C8 = v1;

}

void sub_228FD4428(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A268D8;
  qword_255A268D8 = v1;

}

void sub_228FD447C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A268E8;
  qword_255A268E8 = v1;

}

void sub_228FD44D0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A268F8;
  qword_255A268F8 = v1;

}

void sub_228FD4524(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26908;
  qword_255A26908 = v1;

}

void sub_228FD4578(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26918;
  qword_255A26918 = v1;

}

void sub_228FD483C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26928;
  qword_255A26928 = v1;

}

void sub_228FD4890(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26938;
  qword_255A26938 = v1;

}

void sub_228FD48E4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26948;
  qword_255A26948 = v1;

}

void sub_228FD4938(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26958;
  qword_255A26958 = v1;

}

void sub_228FD498C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26968;
  qword_255A26968 = v1;

}

void sub_228FD4C50(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26978;
  qword_255A26978 = v1;

}

void sub_228FD4CA4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26988;
  qword_255A26988 = v1;

}

void sub_228FD4CF8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26998;
  qword_255A26998 = v1;

}

void sub_228FD4D4C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A269A8;
  qword_255A269A8 = v1;

}

void sub_228FD4DA0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A269B8;
  qword_255A269B8 = v1;

}

void sub_228FD5064(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A269C8;
  qword_255A269C8 = v1;

}

void sub_228FD50B8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A269D8;
  qword_255A269D8 = v1;

}

void sub_228FD510C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A269E8;
  qword_255A269E8 = v1;

}

void sub_228FD5160(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A269F8;
  qword_255A269F8 = v1;

}

void sub_228FD51B4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A08;
  qword_255A26A08 = v1;

}

void sub_228FD5478(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A18;
  qword_255A26A18 = v1;

}

void sub_228FD54CC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A28;
  qword_255A26A28 = v1;

}

void sub_228FD5520(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A38;
  qword_255A26A38 = v1;

}

void sub_228FD5574(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A48;
  qword_255A26A48 = v1;

}

void sub_228FD55C8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A58;
  qword_255A26A58 = v1;

}

void sub_228FD588C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A68;
  qword_255A26A68 = v1;

}

void sub_228FD58E0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A78;
  qword_255A26A78 = v1;

}

void sub_228FD5934(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A88;
  qword_255A26A88 = v1;

}

void sub_228FD5988(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26A98;
  qword_255A26A98 = v1;

}

void sub_228FD59DC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26AA8;
  qword_255A26AA8 = v1;

}

void sub_228FD5AA4(uint64_t a1)
{
  id v1;

  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("is_underline"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_255A26AB8 = objc_msgSend(v1, "BOOLValue");

}

void sub_228FD5D78(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26AC8;
  qword_255A26AC8 = v1;

}

void sub_228FD5DCC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26AD8;
  qword_255A26AD8 = v1;

}

void sub_228FD5E20(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26AE8;
  qword_255A26AE8 = v1;

}

void sub_228FD5E74(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26AF8;
  qword_255A26AF8 = v1;

}

void sub_228FD5EC8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B08;
  qword_255A26B08 = v1;

}

void sub_228FD618C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B18;
  qword_255A26B18 = v1;

}

void sub_228FD61E0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B28;
  qword_255A26B28 = v1;

}

void sub_228FD6234(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B38;
  qword_255A26B38 = v1;

}

void sub_228FD6288(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B48;
  qword_255A26B48 = v1;

}

void sub_228FD62DC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B58;
  qword_255A26B58 = v1;

}

void sub_228FD65A0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B68;
  qword_255A26B68 = v1;

}

void sub_228FD65F4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B78;
  qword_255A26B78 = v1;

}

void sub_228FD6648(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B88;
  qword_255A26B88 = v1;

}

void sub_228FD669C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26B98;
  qword_255A26B98 = v1;

}

void sub_228FD66F0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_text_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26BA8;
  qword_255A26BA8 = v1;

}

void sub_228FD69B4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26BB8;
  qword_255A26BB8 = v1;

}

void sub_228FD6A08(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26BC8;
  qword_255A26BC8 = v1;

}

void sub_228FD6A5C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26BD8;
  qword_255A26BD8 = v1;

}

void sub_228FD6AB0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26BE8;
  qword_255A26BE8 = v1;

}

void sub_228FD6B04(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("highlight_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26BF8;
  qword_255A26BF8 = v1;

}

void sub_228FD6DC8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C08;
  qword_255A26C08 = v1;

}

void sub_228FD6E1C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C18;
  qword_255A26C18 = v1;

}

void sub_228FD6E70(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C28;
  qword_255A26C28 = v1;

}

void sub_228FD6EC4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C38;
  qword_255A26C38 = v1;

}

void sub_228FD6F18(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_fill_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C48;
  qword_255A26C48 = v1;

}

void sub_228FD71DC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C58;
  qword_255A26C58 = v1;

}

void sub_228FD7230(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C68;
  qword_255A26C68 = v1;

}

void sub_228FD7284(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C78;
  qword_255A26C78 = v1;

}

void sub_228FD72D8(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C88;
  qword_255A26C88 = v1;

}

void sub_228FD732C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_marker_border_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26C98;
  qword_255A26C98 = v1;

}

void sub_228FD75F0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26CA8;
  qword_255A26CA8 = v1;

}

void sub_228FD7644(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26CB8;
  qword_255A26CB8 = v1;

}

void sub_228FD7698(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26CC8;
  qword_255A26CC8 = v1;

}

void sub_228FD76EC(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26CD8;
  qword_255A26CD8 = v1;

}

void sub_228FD7740(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  +[AKAnnotationTheme colorForAnnotationStyle:propertyName:pageTheme:](AKAnnotationTheme, "colorForAnnotationStyle:propertyName:pageTheme:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("note_sidebar_bar_color"), *(unsigned int *)(a1 + 40));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26CE8;
  qword_255A26CE8 = v1;

}

void sub_228FD7808(uint64_t a1)
{
  id v1;

  +[AKAnnotationTheme themeItemForAnnotationStyle:propertyName:](AKAnnotationTheme, "themeItemForAnnotationStyle:propertyName:", objc_msgSend(*(id *)(a1 + 32), "annotationStyle"), CFSTR("is_underline"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  byte_255A26CF8 = objc_msgSend(v1, "BOOLValue");

}

void sub_228FD7900()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("note_strikethrough_color"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x24BDF6950], "im_colorWithSRGBDescription:", v3);
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26D08;
  qword_255A26D08 = v1;

}

void sub_228FD79C8()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("note_sidebar_text_color"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x24BDF6950], "im_colorWithSRGBDescription:", v3);
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_255A26D18;
  qword_255A26D18 = v1;

}

uint64_t sub_228FD7C9C(uint64_t a1)
{
  AKAnnotationThemeGreen *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeGreen);
  v3 = (void *)qword_255A26D28;
  qword_255A26D28 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26D28, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD7CDC(uint64_t a1)
{
  AKAnnotationThemeGreen *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeGreen);
  v3 = (void *)qword_255A26D38;
  qword_255A26D38 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26D38, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD7D1C(uint64_t a1)
{
  AKAnnotationThemeGreen *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeGreen);
  v3 = (void *)qword_255A26D48;
  qword_255A26D48 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26D48, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD7D5C(uint64_t a1)
{
  AKAnnotationThemeGreen *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeGreen);
  v3 = (void *)qword_255A26D58;
  qword_255A26D58 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26D58, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD7D9C(uint64_t a1)
{
  AKAnnotationThemeGreen *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeGreen);
  v3 = (void *)qword_255A26D68;
  qword_255A26D68 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26D68, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8028(uint64_t a1)
{
  AKAnnotationThemeBlue *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeBlue);
  v3 = (void *)qword_255A26D78;
  qword_255A26D78 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26D78, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8068(uint64_t a1)
{
  AKAnnotationThemeBlue *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeBlue);
  v3 = (void *)qword_255A26D88;
  qword_255A26D88 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26D88, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD80A8(uint64_t a1)
{
  AKAnnotationThemeBlue *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeBlue);
  v3 = (void *)qword_255A26D98;
  qword_255A26D98 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26D98, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD80E8(uint64_t a1)
{
  AKAnnotationThemeBlue *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeBlue);
  v3 = (void *)qword_255A26DA8;
  qword_255A26DA8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26DA8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8128(uint64_t a1)
{
  AKAnnotationThemeBlue *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeBlue);
  v3 = (void *)qword_255A26DB8;
  qword_255A26DB8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26DB8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD83B4(uint64_t a1)
{
  AKAnnotationThemeYellow *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeYellow);
  v3 = (void *)qword_255A26DC8;
  qword_255A26DC8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26DC8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD83F4(uint64_t a1)
{
  AKAnnotationThemeYellow *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeYellow);
  v3 = (void *)qword_255A26DD8;
  qword_255A26DD8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26DD8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8434(uint64_t a1)
{
  AKAnnotationThemeYellow *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeYellow);
  v3 = (void *)qword_255A26DE8;
  qword_255A26DE8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26DE8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8474(uint64_t a1)
{
  AKAnnotationThemeYellow *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeYellow);
  v3 = (void *)qword_255A26DF8;
  qword_255A26DF8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26DF8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD84B4(uint64_t a1)
{
  AKAnnotationThemeYellow *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeYellow);
  v3 = (void *)qword_255A26E08;
  qword_255A26E08 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E08, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8740(uint64_t a1)
{
  AKAnnotationThemePink *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePink);
  v3 = (void *)qword_255A26E18;
  qword_255A26E18 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E18, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8780(uint64_t a1)
{
  AKAnnotationThemePink *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePink);
  v3 = (void *)qword_255A26E28;
  qword_255A26E28 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E28, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD87C0(uint64_t a1)
{
  AKAnnotationThemePink *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePink);
  v3 = (void *)qword_255A26E38;
  qword_255A26E38 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E38, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8800(uint64_t a1)
{
  AKAnnotationThemePink *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePink);
  v3 = (void *)qword_255A26E48;
  qword_255A26E48 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E48, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8840(uint64_t a1)
{
  AKAnnotationThemePink *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePink);
  v3 = (void *)qword_255A26E58;
  qword_255A26E58 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E58, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8ACC(uint64_t a1)
{
  AKAnnotationThemePurple *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePurple);
  v3 = (void *)qword_255A26E68;
  qword_255A26E68 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E68, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8B0C(uint64_t a1)
{
  AKAnnotationThemePurple *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePurple);
  v3 = (void *)qword_255A26E78;
  qword_255A26E78 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E78, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8B4C(uint64_t a1)
{
  AKAnnotationThemePurple *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePurple);
  v3 = (void *)qword_255A26E88;
  qword_255A26E88 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E88, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8B8C(uint64_t a1)
{
  AKAnnotationThemePurple *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePurple);
  v3 = (void *)qword_255A26E98;
  qword_255A26E98 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26E98, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8BCC(uint64_t a1)
{
  AKAnnotationThemePurple *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemePurple);
  v3 = (void *)qword_255A26EA8;
  qword_255A26EA8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26EA8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8E58(uint64_t a1)
{
  AKAnnotationThemeUnderline *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  v3 = (void *)qword_255A26EB8;
  qword_255A26EB8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26EB8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8E98(uint64_t a1)
{
  AKAnnotationThemeUnderline *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  v3 = (void *)qword_255A26EC8;
  qword_255A26EC8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26EC8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8ED8(uint64_t a1)
{
  AKAnnotationThemeUnderline *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  v3 = (void *)qword_255A26ED8;
  qword_255A26ED8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26ED8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8F18(uint64_t a1)
{
  AKAnnotationThemeUnderline *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  v3 = (void *)qword_255A26EE8;
  qword_255A26EE8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26EE8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

uint64_t sub_228FD8F58(uint64_t a1)
{
  AKAnnotationThemeUnderline *v2;
  void *v3;

  v2 = objc_alloc_init(AKAnnotationThemeUnderline);
  v3 = (void *)qword_255A26EF8;
  qword_255A26EF8 = (uint64_t)v2;

  return objc_msgSend((id)qword_255A26EF8, "setPageTheme:", *(unsigned int *)(a1 + 32));
}

void sub_228FD9344(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("highlight_text_color"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "colorForThemeItem:pageTheme:", v7, *(unsigned int *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255A26F08;
  qword_255A26F08 = v3;

  if (qword_255A26F08)
  {
    v5 = (id)qword_255A26F08;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)qword_255A26F08;
  qword_255A26F08 = (uint64_t)v5;

}

void sub_228FD93E8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("highlight_text_color"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "colorForThemeItem:pageTheme:", v7, *(unsigned int *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255A26F18;
  qword_255A26F18 = v3;

  if (qword_255A26F18)
  {
    v5 = (id)qword_255A26F18;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)qword_255A26F18;
  qword_255A26F18 = (uint64_t)v5;

}

void sub_228FD948C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("highlight_text_color"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "colorForThemeItem:pageTheme:", v7, *(unsigned int *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255A26F28;
  qword_255A26F28 = v3;

  if (qword_255A26F28)
  {
    v5 = (id)qword_255A26F28;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)qword_255A26F28;
  qword_255A26F28 = (uint64_t)v5;

}

void sub_228FD9530(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("highlight_text_color"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "colorForThemeItem:pageTheme:", v7, *(unsigned int *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255A26F38;
  qword_255A26F38 = v3;

  if (qword_255A26F38)
  {
    v5 = (id)qword_255A26F38;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)qword_255A26F38;
  qword_255A26F38 = (uint64_t)v5;

}

void sub_228FD95D4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("highlight_text_color"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "colorForThemeItem:pageTheme:", v7, *(unsigned int *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255A26F48;
  qword_255A26F48 = v3;

  if (qword_255A26F48)
  {
    v5 = (id)qword_255A26F48;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)qword_255A26F48;
  qword_255A26F48 = (uint64_t)v5;

}

void sub_228FD96B8()
{
  void *v0;
  void *v1;
  float v2;
  id v3;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("note_shadow"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("radius"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  *(double *)&qword_255A26F58 = v2;

}

void sub_228FD9774()
{
  void *v0;
  void *v1;
  float v2;
  id v3;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("note_shadow"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKey:", CFSTR("opacity"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  *(double *)&qword_255A26F68 = v2;

}

void sub_228FD9830()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("note_shadow"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("color"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    objc_msgSend(MEMORY[0x24BDF6950], "im_colorWithSRGBDescription:", v1);
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_255A26F78;
  qword_255A26F78 = v2;

}

void sub_228FD9918()
{
  void *v0;
  void *v1;
  void *v2;
  float v3;
  uint64_t v4;
  float v5;
  id v6;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("note_shadow"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("offset_x"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("offset_y"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "floatValue");
  *(double *)&v4 = v3;
  objc_msgSend(v2, "floatValue");
  qword_255A26F88 = v4;
  *(double *)&qword_255A26F90 = v5;

}

void sub_228FD9A10()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  float v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("note_font"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("name"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("size"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v2, "floatValue");
  objc_msgSend(v3, "fontWithName:size:", v1, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_255A26FA0;
  qword_255A26FA0 = v5;

}

void sub_228FD9B10()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  float v4;
  uint64_t v5;
  void *v6;
  id v7;

  +[AKAnnotationTheme themeDescriptions](AKAnnotationTheme, "themeDescriptions");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", CFSTR("note_font_table"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:", CFSTR("name"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("size"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDF6A70];
  objc_msgSend(v2, "floatValue");
  objc_msgSend(v3, "fontWithName:size:", v1, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_255A26FB0;
  qword_255A26FB0 = v5;

}

void sub_228FD9F94(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "tintColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v4, "CGColor");
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

}

void sub_228FD9FF4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v4, "CGColor");
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v2);

}

uint64_t sub_228FDA608()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDD1968], sel_valueWithCGPoint_);
}

uint64_t sub_228FDA614()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDD1968], sel_valueWithCGSize_);
}

uint64_t sub_228FDA620()
{
  return objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:");
}

const CGPath *sub_228FDA638(void *a1)
{
  const CGPath *result;

  result = (const CGPath *)objc_msgSend(objc_retainAutorelease(a1), "CGPath");
  if (result)
    return CGPathCreateMutableCopy(result);
  return result;
}

void sub_228FDC6B0(__IOSurface *a1)
{
  IOSurfaceDecrementUseCount(a1);
  CFRelease(a1);
}

uint64_t sub_228FDC980(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_228FDCA94(uint64_t a1, uint64_t a2)
{
  id v3;

  +[AKTextAnnotationAttributeHelper font:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "font:byApplyingScaleFactor:", a2, *(double *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t sub_228FDCBEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x24BDF65F8], *(_QWORD *)(a1 + 40), a3, a4);
}

uint64_t sub_228FDCEE8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t sub_228FDCFD4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void sub_228FDD92C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;

  v7 = a2;
  objc_msgSend((id)objc_opt_class(), "font:byApplyingScaleFactor:", v7, *(double *)(a1 + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v8, a3, a4);
}

void sub_228FDDB68(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF6620]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

BOOL sub_228FDE55C()
{
  void *v0;
  uint64_t v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 != 1)
    return 0;
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 >= v6)
    v7 = v6;
  else
    v7 = v4;
  return v7 > 768.0;
}

void sub_228FDF08C(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "toolPicker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVisible");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_forceToolPickerVisibleForViewStateChange:", 0);
}

void sub_228FE0184(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_228FE01A0(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[52], "setAlpha:", *(double *)(a1 + 40));
  objc_msgSend(WeakRetained[53], "setAlpha:", *(double *)(a1 + 40));

}

uint64_t sub_228FE0200(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_shouldUseCachedSafeAreaInsets:", 0);
}

void sub_228FE0668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location)
{
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 152));
  _Unwind_Resume(a1);
}

uint64_t sub_228FE06B0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_228FE06C4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_undo:", 0);
  objc_msgSend(WeakRetained, "_cleanupAfterUndoAlert");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_228FE0714(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_undoAll:", 0);
  objc_msgSend(WeakRetained, "_cleanupAfterUndoAlert");
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_228FE0764(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL sub_228FE1358(void *a1)
{
  void *v1;
  _BOOL8 v2;

  if (!a1)
    return 0;
  objc_msgSend(a1, "presentingViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

uint64_t sub_228FE1394(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((objc_msgSend(v1, "isBeingPresented") & 1) != 0)
      v3 = 1;
    else
      v3 = objc_msgSend(v2, "isBeingDismissed");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t sub_228FE1AD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signaturesViewControllerContinueToCreateSignature:", 0);
}

void sub_228FE1AE0(uint64_t a1)
{
  AKSignaturesViewController_iOS *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AKSignaturesViewController_iOS *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AKSignaturesViewController_iOS *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  AKSignaturesViewController_iOS *v27;
  _QWORD v28[5];
  AKSignaturesViewController_iOS *v29;

  v2 = -[AKSignaturesViewController_iOS initWithController:]([AKSignaturesViewController_iOS alloc], "initWithController:", *(_QWORD *)(a1 + 32));
  -[AKSignaturesViewController_iOS setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  -[AKSignaturesViewController_iOS setPresentedInAlert:](v2, "setPresentedInAlert:", 1);
  -[AKSignaturesViewController_iOS setShowsNavigationBar:](v2, "setShowsNavigationBar:", 0);
  -[AKSignaturesViewController_iOS setAllowsEdits:](v2, "setAllowsEdits:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS setTableBackgroundColor:](v2, "setTableBackgroundColor:", v3);

  +[AKAlertController alertControllerWithTitle:message:preferredStyle:](AKAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModalPresentationStyle:", 7);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  objc_msgSend(v4, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPermittedArrowDirections:", 3);

  objc_msgSend(v4, "setContentViewController:", v2);
  v8 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Add or Remove Signature"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_228FE1DA8;
  v28[3] = &unk_24F1A76A8;
  v28[4] = *(_QWORD *)(a1 + 40);
  v12 = v2;
  v29 = v12;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v11;
  v23 = 3221225472;
  v24 = sub_228FE1DB4;
  v25 = &unk_24F1A76A8;
  v26 = *(_QWORD *)(a1 + 40);
  v27 = v12;
  v17 = v12;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, &v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAction:", v18, v22, v23, v24, v25, v26);

  objc_msgSend(*(id *)(a1 + 40), "_setPopoverPresentationSource:fromSender:sourceRect:", v4, *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 40), "_presentViewController:animated:", v4, 1);
  v19 = *(_QWORD *)(a1 + 40);
  v20 = *(void **)(v19 + 504);
  *(_QWORD *)(v19 + 504) = v4;
  v21 = v4;

}

uint64_t sub_228FE1DA8(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_signaturesViewControllerContinueToManageSignatures_);
}

uint64_t sub_228FE1DB4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signaturesViewControllerDidCancel:", *(_QWORD *)(a1 + 40));
}

void sub_228FE1E3C(uint64_t a1)
{
  AKTextAttributesViewController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 1);
  objc_msgSend(*(id *)(a1 + 32), "annotationController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[AKTextAttributesViewController initWithController:]([AKTextAttributesViewController alloc], "initWithController:", v15);
  -[AKTextAttributesViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 7);
  v3 = *(_QWORD *)(a1 + 32);
  -[AKTextAttributesViewController popoverPresentationController](v2, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_toolPickerPopoverConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passthroughViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKTextAttributesViewController popoverPresentationController](v2, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPassthroughViews:", v6);

  -[AKTextAttributesViewController popoverPresentationController](v2, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setShouldDisableInteractionDuringTransitions:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_toolPickerPopoverConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "permittedArrowDirections");
  -[AKTextAttributesViewController popoverPresentationController](v2, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPermittedArrowDirections:", v10);

  -[AKTextAttributesViewController popoverPresentationController](v2, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setIgnoresKeyboardNotifications:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_setPopoverPresentationSource:fromSender:", v2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_presentViewController:animated:", v2, 1);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 520);
  *(_QWORD *)(v13 + 520) = v2;

}

void sub_228FE2110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_228FE2128(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 0);
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "didDismissPopover");
}

uint64_t sub_228FE2168(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_228FE2178(uint64_t a1)
{

}

uint64_t sub_228FE2180(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "popoverPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", 0);

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_clearPresentedPopoverPointers");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_228FE2404(uint64_t a1)
{
  AKToolsListViewController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;

  objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 1);
  v2 = objc_alloc_init(AKToolsListViewController);
  -[AKToolsListViewController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[AKToolsListViewController setModalPresentationStyle:](v2, "setModalPresentationStyle:", 7);
  v3 = *(_QWORD *)(a1 + 32);
  -[AKToolsListViewController popoverPresentationController](v2, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v3);

  -[AKToolsListViewController traitCollection](v2, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");

  if (v6 == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKToolsListViewController popoverPresentationController](v2, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

  objc_msgSend(*(id *)(a1 + 32), "_toolPickerPopoverConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "permittedArrowDirections");
  -[AKToolsListViewController popoverPresentationController](v2, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPermittedArrowDirections:", v10);

  -[AKToolsListViewController popoverPresentationController](v2, "popoverPresentationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_setIgnoresKeyboardNotifications:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_paletteView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "_toolPickerPopoverConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layoutSceneMargins");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[AKToolsListViewController popoverPresentationController](v2, "popoverPresentationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPopoverLayoutMargins:", v16, v18, v20, v22);

  }
  objc_msgSend(*(id *)(a1 + 32), "_setPopoverPresentationSource:fromSender:", v2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_presentViewController:animated:", v2, 1);
  v24 = *(_QWORD *)(a1 + 32);
  v25 = *(void **)(v24 + 544);
  *(_QWORD *)(v24 + 544) = v2;

}

void sub_228FE268C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  AKAttributePickerViewController *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  AKAttributePickerViewController *v22;
  id v23;

  objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 1);
  objc_msgSend(*(id *)(a1 + 32), "annotationController");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentPageController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pageModelController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "selectedAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AKAttributePickerViewController initWithController:selectedAnnotations:]([AKAttributePickerViewController alloc], "initWithController:selectedAnnotations:", v23, v4);
  -[AKAttributePickerViewController setDelegate:](v5, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[AKAttributePickerViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7);
  v6 = *(_QWORD *)(a1 + 32);
  -[AKAttributePickerViewController popoverPresentationController](v5, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v6);

  -[AKAttributePickerViewController traitCollection](v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle");

  if (v9 == 2)
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributePickerViewController popoverPresentationController](v5, "popoverPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  objc_msgSend(*(id *)(a1 + 32), "_toolPickerPopoverConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "permittedArrowDirections");
  -[AKAttributePickerViewController popoverPresentationController](v5, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setPermittedArrowDirections:", v13);

  -[AKAttributePickerViewController popoverPresentationController](v5, "popoverPresentationController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_setShouldDisableInteractionDuringTransitions:", 0);

  objc_msgSend(*(id *)(a1 + 32), "_toolPickerPopoverConfiguration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "passthroughViews");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAttributePickerViewController popoverPresentationController](v5, "popoverPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setPassthroughViews:", v17);

  -[AKAttributePickerViewController popoverPresentationController](v5, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_setIgnoresKeyboardNotifications:", 1);

  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(void **)(v20 + 552);
  *(_QWORD *)(v20 + 552) = v5;
  v22 = v5;

  objc_msgSend(*(id *)(a1 + 32), "_setPopoverPresentationSource:fromSender:", v22, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_presentViewController:animated:", v22, 1);

}

uint64_t sub_228FE2CD8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didDismissPopoverAndRestorePalette");
}

void sub_228FE2E9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_228FE2EB8(uint64_t a1)
{
  void *v2;
  id v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[63], "popoverPresentationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDelegate:", 0);

  v3 = WeakRetained[63];
  WeakRetained[63] = 0;

  objc_msgSend(*(id *)(a1 + 32), "didDismissPopoverAndRestorePalette");
}

void sub_228FE317C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  AKSignatureCreationViewController_iOS *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  AKSignatureCreationViewController_iOS *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "annotationController");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "controllerWillShowSignatureCaptureView:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 528), "setDelegate:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 528);
  *(_QWORD *)(v4 + 528) = 0;

  v6 = -[AKSignatureCreationViewController_iOS initWithController:]([AKSignatureCreationViewController_iOS alloc], "initWithController:", v12);
  -[AKSignatureCreationViewController_iOS setModalTransitionStyle:](v6, "setModalTransitionStyle:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_configureCustomDetentPresentationIfNeeded:", v6);
  -[AKSignatureCreationViewController_iOS setModalPresentationStyle:](v6, "setModalPresentationStyle:", 2);
  -[AKSignatureCreationViewController_iOS setModalInPresentation:](v6, "setModalInPresentation:", 1);
  -[AKSignatureCreationViewController_iOS setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  v7 = *(_QWORD *)(a1 + 32);
  -[AKSignatureCreationViewController_iOS popoverPresentationController](v6, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v7);

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 536);
  *(_QWORD *)(v9 + 536) = v6;
  v11 = v6;

  objc_msgSend(*(id *)(a1 + 32), "_presentViewController:animated:", v11, 1);
}

double sub_228FE33E4(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "maximumDetentValue");
  return v2 + -44.0;
}

uint64_t sub_228FE359C(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__presentImageDescriptionViewController);
}

void sub_228FE35A4(uint64_t a1)
{
  void *v2;
  AKMinimalUserInterfaceItem *v3;

  v3 = -[AKMinimalUserInterfaceItem initWithTag:]([AKMinimalUserInterfaceItem alloc], "initWithTag:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "annotationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performActionForSender:", v3);

}

void sub_228FE3994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_228FE39B8(uint64_t a1)
{
  void *v1;
  id v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[69], "popoverPresentationController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setDelegate:", 0);

  v2 = WeakRetained[69];
  WeakRetained[69] = 0;

}

uint64_t sub_228FE4550()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "executablePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "containsString:", CFSTR("MarkupPhotoExtension.appex/"));

  return v2;
}

void sub_228FE66AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = *MEMORY[0x24BDF6628];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF6628]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setTabStops:", MEMORY[0x24BDBD1A8]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, v9);
  v25 = a3;
  v26 = a4;
  v24 = a1;
  if (qword_255A26FC0 != -1)
    dispatch_once(&qword_255A26FC0, &unk_24F1A7118);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = (id)qword_255A26FB8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = v18;
          objc_msgSend(v18, "colorUsingSRGBColorSpace");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  v21 = *MEMORY[0x24BDF6620];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF6620]);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = *MEMORY[0x24BDF65F8];
  if (!v22)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDF65F8]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, v23);
  objc_msgSend(v8, "removeObjectForKey:", v21);
  objc_msgSend(*(id *)(v24 + 32), "setAttributes:range:", v8, v25, v26);

}

void sub_228FE68FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDF65C8];
  v5[0] = *MEMORY[0x24BDF6600];
  v5[1] = v0;
  v1 = *MEMORY[0x24BDF66D0];
  v5[2] = *MEMORY[0x24BDF6698];
  v5[3] = v1;
  v2 = *MEMORY[0x24BDF65D0];
  v5[4] = *MEMORY[0x24BDF6650];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_255A26FB8;
  qword_255A26FB8 = v3;

}

void sub_228FE6D70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_228FE6D80(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_228FE8714(uint64_t a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(id *)(a1 + 32);
  objc_msgSend(v1, "candidatePickerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "candidatePickerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(v1, "setCandidatePickerView:", 0);
  objc_msgSend(v4, "updateConstraintsIfNeeded");

}

void sub_228FE9C6C(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  id v11;
  double v12;
  char v13;
  double Height;
  double Width;
  double MidX;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v11 = a1;
  v12 = a6 * 3.14159265 / 180.0;
  v21 = v11;
  if (v12 > 0.785398163)
  {
    v13 = 0;
    do
    {
      v12 = v12 + -1.57079633;
      ++v13;
    }
    while (v12 > 0.785398163);
    if ((v13 & 1) != 0)
    {
      v22.origin.x = a2;
      v22.origin.y = a3;
      v22.size.width = a4;
      v22.size.height = a5;
      Height = CGRectGetHeight(v22);
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.width = a4;
      v23.size.height = a5;
      Width = CGRectGetWidth(v23);
      v24.origin.x = a2;
      v24.origin.y = a3;
      v24.size.width = a4;
      v24.size.height = a5;
      MidX = CGRectGetMidX(v24);
      v25.origin.x = a2;
      v25.origin.y = a3;
      v25.size.width = a4;
      v25.size.height = a5;
      +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", Height, Width, MidX, CGRectGetMidY(v25));
      v11 = v21;
      a2 = v17;
      a3 = v18;
      a4 = v19;
      a5 = v20;
    }
  }
  objc_msgSend(v11, "setRectangle:", a2, a3, a4, a5);
  objc_msgSend(v21, "setRotationAngle:", v12);

}

void sub_228FEAD30(uint64_t a1, uint64_t a2, void *a3, int a4, float64x2_t *a5, void *a6, void *a7, double a8, double a9, double a10, double a11)
{
  id v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  float64_t v26;
  __int128 v27;
  void *v28;
  void *v29;
  __int128 v30;
  float64x2_t v31;
  id v32;

  v32 = a3;
  v21 = a7;
  v22 = a6;
  +[AKGeometryHelper adjustPoint:forExifOrientation:aboutCenter:](AKGeometryHelper, "adjustPoint:forExifOrientation:aboutCenter:", a2, a8, a9, a10, a11);
  if (a4)
  {
    v31 = vaddq_f64(a5[2], vmlaq_n_f64(vmulq_n_f64(a5[1], v24), *a5, v23));
    objc_msgSend(v32, "geometryHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "screenPixelAlignedPointForPoint:", *(_OWORD *)&v31);
    v30 = v27;
    v31.f64[0] = v26;

    v24 = *(double *)&v30;
    v23 = v31.f64[0];
  }
  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v23, v24, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v28);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v29);

}

id sub_228FEB66C(void *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingLeadingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id sub_228FEB6B8(void *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingTrailingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id sub_228FEB704(void *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingLeadingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id sub_228FEB750(void *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringByTrimmingTrailingCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id sub_228FEB79C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v11 - v6;
  objc_msgSend(a1, "getCharacters:range:", (char *)v11 - v6, 0, v5);
  v8 = 0;
  if (v5)
  {
    while (objc_msgSend(v4, "characterIsMember:", *(unsigned __int16 *)&v7[2 * v8]))
    {
      if (v5 == ++v8)
      {
        v8 = v5;
        break;
      }
    }
  }
  objc_msgSend(a1, "substringWithRange:", v8, v5 - v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_228FEB898(void *a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v12 - v6;
  objc_msgSend(a1, "getCharacters:range:", (char *)v12 - v6, 0, v5);
  v8 = v7 - 2;
  do
  {
    v9 = v5;
    if (!v5)
      break;
    --v5;
  }
  while ((objc_msgSend(v4, "characterIsMember:", *(unsigned __int16 *)&v8[2 * v9]) & 1) != 0);
  objc_msgSend(a1, "substringWithRange:", 0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id sub_228FEB98C(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_228FEBA90;
  v11[3] = &unk_24F1A7810;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = sub_228FEBAD4;
  v9[3] = &unk_24F1A7810;
  v7 = (id)objc_opt_new();
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void sub_228FEBA90(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "stringByTrimmingTrailingWhitespace");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void sub_228FEBAD4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v3);

}

__CFString *sub_228FEBB2C(void *a1)
{
  __CFString *v2;

  if ((objc_msgSend(a1, "isEqualToString:", CFSTR(".")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("..")) & 1) != 0)
  {
    v2 = &stru_24F1A83D0;
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

void sub_228FEE26C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "convertFont:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v7, a3, a4);

}

void sub_228FEE2D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "convertTextAttributes:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v7, a3, a4);

}

void sub_228FEE338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  +[AKTextAnnotationAttributeHelper font:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "font:byApplyingScaleFactor:", a2, *(double *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "convertFont:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKTextAnnotationAttributeHelper font:byApplyingScaleFactor:](AKTextAnnotationAttributeHelper, "font:byApplyingScaleFactor:", v8, *(double *)(a1 + 56));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", *MEMORY[0x24BDF65F8], v9, a3, a4);
}

void sub_228FEE3E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "convertTextAttributes:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v7, a3, a4);

}

void sub_228FEFF90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_228FF0030(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_askAnnotationControllerDelegateToEnterFullScreen:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "becomeFirstResponder");
}

Class sub_228FF0148(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_255A26FD0)
  {
    qword_255A26FD0 = _sl_dlopen();
    if (!qword_255A26FD0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AXSSImageDescriptionViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)sub_22907F92C();
    free(v3);
  }
  qword_255A26FC8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double sub_228FF3910(void *a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationInView:", v2);
  v4 = v3;
  v6 = v5;

  objc_msgSend(a1, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", 0, v4, v6);
  v9 = v8;

  return v9;
}

void sub_228FF3A20(CGContextRef c, CGFloat a2)
{
  CGAffineTransform v3;
  CGAffineTransform v4;

  if (a2 == 0.0)
  {
    NSLog(CFSTR("BOGUS - lineWidth is 0."));
    CGContextGetCTM(&v3, c);
    CGAffineTransformInvert(&v4, &v3);
    a2 = v4.a + v4.c;
  }
  CGContextSetLineWidth(c, a2);
}

void sub_228FF3C40(void *a1, uint64_t a2)
{
  id v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  id v15;

  v3 = a1;
  v15 = v3;
  switch(*(_DWORD *)a2)
  {
    case 0:
      objc_msgSend(v3, "moveToPoint:", **(double **)(a2 + 8), *(double *)(*(_QWORD *)(a2 + 8) + 8));
      goto LABEL_8;
    case 1:
      objc_msgSend(v3, "lineToPoint:", **(double **)(a2 + 8), *(double *)(*(_QWORD *)(a2 + 8) + 8));
      goto LABEL_8;
    case 2:
      objc_msgSend(v3, "currentPoint");
      v4 = *(double **)(a2 + 8);
      v5 = v4[1];
      v7 = v6 * 0.33333 + *v4 * 0.66667;
      v9 = v8 * 0.33333 + v5 * 0.66667;
      v10 = v4[2] * 0.33333 + *v4 * 0.66667;
      v11 = v4[3] * 0.33333 + v5 * 0.66667;
      v3 = v15;
      v12 = v4[2];
      v13 = v4[3];
      goto LABEL_6;
    case 3:
      v14 = *(double **)(a2 + 8);
      v12 = v14[4];
      v13 = v14[5];
      v7 = *v14;
      v9 = v14[1];
      v10 = v14[2];
      v11 = v14[3];
LABEL_6:
      objc_msgSend(v3, "curveToPoint:controlPoint1:controlPoint2:", v12, v13, v7, v9, v10, v11);
      goto LABEL_8;
    case 4:
      objc_msgSend(v3, "closePath");
LABEL_8:
      v3 = v15;
      break;
    default:
      break;
  }

}

void sub_228FF4848(void *a1, CGContext *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  CGFloat *v6;
  _QWORD *v7;

  v7 = a1;
  v3 = v7[1];
  if (v3 >= 1)
  {
    v4 = v7[3];
    v5 = v4 + 24 * v3;
    v6 = (CGFloat *)v7[7];
    do
    {
      switch(*(_DWORD *)v4 & 0xF)
      {
        case 0:
          CGContextMoveToPoint(a2, *(CGFloat *)(v4 + 8), *(CGFloat *)(v4 + 16));
          break;
        case 1:
          CGContextAddLineToPoint(a2, *(CGFloat *)(v4 + 8), *(CGFloat *)(v4 + 16));
          break;
        case 2:
          CGContextAddCurveToPoint(a2, *v6, v6[1], v6[2], v6[3], *(CGFloat *)(v4 + 8), *(CGFloat *)(v4 + 16));
          v6 += 4;
          break;
        case 3:
          CGContextClosePath(a2);
          break;
        default:
          break;
      }
      v4 += 24;
    }
    while (v4 < v5);
  }

}

void sub_228FF7830(uint64_t a1, float *a2)
{
  uint64_t v4;
  double v5;
  double v6;
  float v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v22;
  uint64_t v23;
  float64x2_t v24;
  float64x2_t *v25;
  float64x2_t v26;
  uint64_t v27;
  __int128 *v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[64];
  _BYTE v34[64];
  _OWORD v35[16];
  uint64_t v36;

  v4 = 0;
  v36 = *MEMORY[0x24BDAC8D0];
  v5 = *(double *)a1;
  v6 = *(double *)(a1 + 8);
  v7 = 0.0;
  v8 = v6;
  v9 = *(double *)a1;
  do
  {
    v10 = *(double *)(a1 + v4 + 16);
    v11 = *(double *)(a1 + v4 + 24);
    v7 = sub_22902DF24(v9, v8, v10, v11) + v7;
    v4 += 16;
    v8 = v11;
    v9 = v10;
  }
  while (v4 != 48);
  v12 = sub_22902DF24(v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));
  if ((float)(v7 - v12) <= 0.1)
  {
    *a2 = *a2 + v7;
  }
  else
  {
    v13 = *(_OWORD *)(a1 + 16);
    v35[0] = *(_OWORD *)a1;
    v35[1] = v13;
    v14 = *(_OWORD *)(a1 + 48);
    v35[2] = *(_OWORD *)(a1 + 32);
    v35[3] = v14;
    v15 = 3;
    v16 = 1;
    __asm { FMOV            V0.2D, #0.5 }
    v22 = v35;
    do
    {
      v23 = 0;
      v24 = (float64x2_t)v35[4 * v16 - 4];
      do
      {
        v25 = (float64x2_t *)&v22[v23];
        v26 = v25[1];
        v25[4] = vmlaq_f64(vmulq_f64(v26, _Q0), _Q0, v24);
        ++v23;
        v24 = v26;
      }
      while (v15 != v23);
      ++v16;
      --v15;
      v22 += 4;
    }
    while (v16 != 4);
    v27 = 0;
    v28 = v35;
    do
    {
      v29 = *v28;
      v28 += 4;
      *(_OWORD *)&v34[v27] = v29;
      v27 += 16;
    }
    while (v27 != 64);
    v30 = v33;
    v31 = 3;
    v32 = 12;
    do
    {
      *v30++ = v35[v32];
      --v31;
      v32 -= 3;
    }
    while (v31 != -1);
    sub_228FF7830(v34, a2);
    sub_228FF7830(v33, a2);
  }
}

void sub_228FF8750(uint64_t a1, void *a2, int a3, float64x2_t *a4, void *a5, void *a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  id v23;
  id v24;
  double v25;
  double v26;
  void *v27;
  float64_t v28;
  __int128 v29;
  void *v30;
  void *v31;
  __int128 v32;
  float64x2_t v33;
  id v34;

  v34 = a2;
  v23 = a6;
  v24 = a5;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v34, a7, a8, a9, a10, a11, a12);
  if (a3)
  {
    v33 = vaddq_f64(a4[2], vmlaq_n_f64(vmulq_n_f64(a4[1], v26), *a4, v25));
    objc_msgSend(v34, "geometryHelper");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "screenPixelAlignedPointForPoint:", *(_OWORD *)&v33);
    v32 = v29;
    v33.f64[0] = v28;

    v26 = *(double *)&v32;
    v25 = v33.f64[0];
  }
  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v25, v26, v32);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v30);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v31);

}

id sub_228FF9FAC(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithScale:", 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageByApplyingSymbolConfiguration:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_configurationIgnoringDynamicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void *sub_228FFA84C(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_255A27008)
  {
    v2 = (void *)qword_255A27008;
  }
  else
  {
    qword_255A27008 = _sl_dlopen();
    v2 = (void *)qword_255A27008;
    if (!qword_255A27008)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_255A27000 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_228FFB178(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("AKPeripheralAvailabilityManagerAvailabilityNotification"), *(_QWORD *)(a1 + 32), 0);

}

void sub_228FFB338(void *a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v5 = a1;
  v3 = objc_msgSend(v5, "currentAvailability");
  if (a2)
  {
    if (v3)
    {
      v4 = 0;
LABEL_6:
      objc_msgSend(v5, "setCurrentAvailability:", v4);
      objc_msgSend(v5, "postConnectionStatusNotification");
    }
  }
  else if (v3 != 1)
  {
    v4 = 1;
    goto LABEL_6;
  }

}

void sub_228FFB398(void *a1)
{
  id v1;

  v1 = a1;
  if (objc_msgSend(v1, "currentAvailability"))
  {
    objc_msgSend(v1, "setCurrentAvailability:", 0);
    objc_msgSend(v1, "postConnectionStatusNotification");
  }

}

void sub_228FFC80C(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "signatureView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_228FFC840(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "signatureView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "signatureView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clear");

}

uint64_t sub_228FFCAAC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "signatureView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

  }
  v3 = objc_msgSend(*(id *)(a1 + 40), "verticalSizeClass");
  v4 = 288.0;
  if (v3 != 1)
    v4 = 388.0;
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", 540.0, v4);
}

void sub_228FFCB18(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "signatureView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 1.0);

    objc_msgSend(*(id *)(a1 + 32), "signatureView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "clear");

  }
}

uint64_t sub_228FFCDC0(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__notifyDidDismiss);
}

uint64_t sub_228FFD014(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__notifyDidDismiss);
}

void sub_228FFD518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, id *a11)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v11 - 136));
  objc_destroyWeak((id *)(v11 - 128));
  _Unwind_Resume(a1);
}

void sub_228FFD580(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateSignatureDescriptionWithStringValue:", *(_QWORD *)(a1 + 32));

}

void sub_228FFD5BC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_228FFD670;
  v5[3] = &unk_24F1A77E0;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v5);

  objc_destroyWeak(&v6);
}

void sub_228FFD65C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_228FFD670(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showEditCustomDescriptionAlert");

}

void sub_228FFD69C(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_228FFD750;
  v5[3] = &unk_24F1A77E0;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v5);

  objc_destroyWeak(&v6);
}

void sub_228FFD73C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_228FFD750(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removeSignatureDescription");

}

void sub_228FFDA24(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 120));
  objc_destroyWeak((id *)(v5 - 112));
  _Unwind_Resume(a1);
}

void sub_228FFDA7C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  +[AKController akBundle](AKController, "akBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Label"), &stru_24F1A83D0, CFSTR("AKSignatureCreationViewController_iOS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPlaceholder:", v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "descriptionTag") == -1)
  {
    objc_msgSend(v6, "customDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

  }
}

void sub_228FFDB44(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

}

void sub_228FFDB78(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "textFields");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "_updateSignatureDescriptionWithStringValue:", v5);

    objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 1, 0);
    WeakRetained = v7;
  }

}

void sub_229001168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22900118C(uint64_t a1, double *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id WeakRetained;
  double v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "interfaceScale");
  if (a3)
  {
    v5 = a3;
    do
    {
      if (COERCE_FLOAT(*((_QWORD *)a2 + 1)) > 0.00001)
      {
        v8 = *a2;
        objc_msgSend(WeakRetained, "bitmapFifo");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addPoint:", v8);

      }
      a2 += 2;
      --v5;
    }
    while (v5);
  }
  objc_msgSend(WeakRetained, "setTotalPointsAdded:", objc_msgSend(WeakRetained, "totalPointsAdded") + a3);

}

void sub_229001A08(uint64_t a1)
{
  id WeakRetained;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplayInRect:", *(double *)(*(_QWORD *)(a1 + 32) + 448), *(double *)(*(_QWORD *)(a1 + 32) + 456), *(double *)(*(_QWORD *)(a1 + 32) + 464), *(double *)(*(_QWORD *)(a1 + 32) + 472));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 584));
  objc_msgSend(WeakRetained, "signatureViewSignatureUpdated:", *(_QWORD *)(a1 + 32));

}

uint64_t sub_229001B38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "minPressure");
  qword_255A27010 = v2;
  objc_msgSend(*(id *)(a1 + 32), "maxPressure");
  qword_255A27018 = v3;
  objc_msgSend(*(id *)(a1 + 32), "minThickness");
  qword_255A27020 = v4;
  result = objc_msgSend(*(id *)(a1 + 32), "maxThickness");
  qword_255A27028 = v6;
  return result;
}

void sub_2290024CC()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[AKController akBundleIdentifier](AKController, "akBundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "initWithSuiteName:", v1);

  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("AKLegacyDoodlesEnabled"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      byte_255A27038 = objc_msgSend(v3, "BOOLForKey:", CFSTR("AKLegacyDoodlesEnabled"));
  }

}

uint64_t sub_2290044A8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "revalidateItems");
}

void sub_229004948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229004994(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_undoButtonAction:", 0);

}

void sub_2290049C4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_undoAllButtonAction:", 0);

}

uint64_t sub_229004BD4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signaturesViewControllerContinueToCreateSignature:", 0);
}

void sub_229004BE0(uint64_t a1)
{
  AKSignaturesViewController_iOS *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  AKSignaturesViewController_iOS *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  AKSignaturesViewController_iOS *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  AKSignaturesViewController_iOS *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[5];
  AKSignaturesViewController_iOS *v54;
  _QWORD v55[5];
  AKSignaturesViewController_iOS *v56;
  _QWORD v57[5];
  AKSignaturesViewController_iOS *v58;

  v2 = -[AKSignaturesViewController_iOS initWithController:]([AKSignaturesViewController_iOS alloc], "initWithController:", *(_QWORD *)(a1 + 32));
  -[AKSignaturesViewController_iOS setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  -[AKSignaturesViewController_iOS setPresentedInAlert:](v2, "setPresentedInAlert:", 1);
  -[AKSignaturesViewController_iOS setShowsNavigationBar:](v2, "setShowsNavigationBar:", 0);
  -[AKSignaturesViewController_iOS setAllowsEdits:](v2, "setAllowsEdits:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKSignaturesViewController_iOS setTableBackgroundColor:](v2, "setTableBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSignaturesAlertController:", v4);

  objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setModalPresentationStyle:", 7);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(v6, "signaturesAlertController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", v6);

  objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "popoverPresentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPermittedArrowDirections:", 3);

  objc_msgSend(*(id *)(a1 + 40), "signatureButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "customView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "signatureButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "customView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourceView:", v15);

    objc_msgSend(*(id *)(a1 + 40), "signatureButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "customView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "popoverPresentationController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSourceRect:", v20, v22, v24, v26);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "popoverPresentationController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBarButtonItem:", v14);
  }

  objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setContentViewController:", v2);

  objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("Add or Remove Signature"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x24BDAC760];
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = sub_229005104;
  v57[3] = &unk_24F1A76A8;
  v57[4] = *(_QWORD *)(a1 + 40);
  v35 = v2;
  v58 = v35;
  objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 0, v57);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addAction:", v36);

  objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Draw a Signature"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v34;
  v55[1] = 3221225472;
  v55[2] = sub_229005110;
  v55[3] = &unk_24F1A76A8;
  v55[4] = *(_QWORD *)(a1 + 40);
  v41 = v35;
  v56 = v41;
  objc_msgSend(v38, "actionWithTitle:style:handler:", v40, 0, v55);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addAction:", v42);

  objc_msgSend(*(id *)(a1 + 40), "signaturesAlertController");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x24BDF67E8];
  +[AKController akBundle](AKController, "akBundle");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_24F1A83D0, CFSTR("AKToolbarViewController_iOS"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v34;
  v53[1] = 3221225472;
  v53[2] = sub_22900511C;
  v53[3] = &unk_24F1A76A8;
  v53[4] = *(_QWORD *)(a1 + 40);
  v54 = v41;
  v47 = v41;
  objc_msgSend(v44, "actionWithTitle:style:handler:", v46, 1, v53);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addAction:", v48);

  v49 = *(void **)(a1 + 40);
  objc_msgSend(v49, "signaturesAlertController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "presentViewController:animated:completion:", v50, 1, 0);

  v51 = *(void **)(a1 + 40);
  objc_msgSend(v51, "signaturesAlertController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "_setupPassthroughViewsForViewController:", v52);

}

uint64_t sub_229005104(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_signaturesViewControllerContinueToManageSignatures_);
}

uint64_t sub_229005110(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_signaturesViewControllerEnterSignatureMode_);
}

uint64_t sub_22900511C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signaturesViewControllerDidCancel:", *(_QWORD *)(a1 + 40));
}

void sub_2290051A0(uint64_t a1)
{
  AKLineStylesViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 1);
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[AKLineStylesViewController initWithController:]([AKLineStylesViewController alloc], "initWithController:", v31);
  objc_msgSend(*(id *)(a1 + 32), "setLineStylesViewController:", v2);

  objc_msgSend(*(id *)(a1 + 32), "lineStylesViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalPresentationStyle:", 7);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "lineStylesViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "lineStylesViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPermittedArrowDirections:", 3);

  objc_msgSend(*(id *)(a1 + 32), "lineStyleButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "lineStyleButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "customView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "lineStylesViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSourceView:", v13);

    objc_msgSend(*(id *)(a1 + 32), "lineStyleButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 32), "lineStylesViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSourceRect:", v18, v20, v22, v24);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "lineStylesViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "popoverPresentationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBarButtonItem:", v12);
  }

  v27 = *(void **)(a1 + 32);
  objc_msgSend(v27, "lineStylesViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "presentViewController:animated:completion:", v28, 1, 0);

  v29 = *(void **)(a1 + 32);
  objc_msgSend(v29, "lineStylesViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_setupPassthroughViewsForViewController:", v30);

}

void sub_229005484(uint64_t a1)
{
  AKTextAttributesViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 1);
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[AKTextAttributesViewController initWithController:]([AKTextAttributesViewController alloc], "initWithController:", v31);
  objc_msgSend(*(id *)(a1 + 32), "setTextAttributesViewController:", v2);

  objc_msgSend(*(id *)(a1 + 32), "textAttributesViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalPresentationStyle:", 7);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "textAttributesViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "textAttributesViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPermittedArrowDirections:", 3);

  objc_msgSend(*(id *)(a1 + 32), "textStyleButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "textStyleButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "customView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "textAttributesViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSourceView:", v13);

    objc_msgSend(*(id *)(a1 + 32), "textStyleButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 32), "textAttributesViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSourceRect:", v18, v20, v22, v24);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "textAttributesViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "popoverPresentationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBarButtonItem:", v12);
  }

  v27 = *(void **)(a1 + 32);
  objc_msgSend(v27, "textAttributesViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "presentViewController:animated:completion:", v28, 1, 0);

  v29 = *(void **)(a1 + 32);
  objc_msgSend(v29, "textAttributesViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_setupPassthroughViewsForViewController:", v30);

}

void sub_229005768(uint64_t a1)
{
  AKColorPickerViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;

  objc_msgSend(MEMORY[0x24BDF6CA8], "_setAlwaysAllowPopoverPresentations:", 1);
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[AKColorPickerViewController initWithController:]([AKColorPickerViewController alloc], "initWithController:", v34);
  objc_msgSend(*(id *)(a1 + 32), "setColorPickerPopoverViewController:", v2);

  objc_msgSend(*(id *)(a1 + 32), "colorPickerPopoverViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModalPresentationStyle:", 7);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "colorPickerPopoverViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "popoverPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "colorPickerPopoverViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPermittedArrowDirections:", 3);

  objc_msgSend(*(id *)(a1 + 32), "strokeColorButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "customView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "strokeColorButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "customView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "colorPickerPopoverViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "popoverPresentationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSourceView:", v13);

    objc_msgSend(*(id *)(a1 + 32), "strokeColorButton");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "customView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 32), "colorPickerPopoverViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSourceRect:", v18, v20, v22, v24);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "colorPickerPopoverViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "popoverPresentationController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBarButtonItem:", v12);
  }

  v27 = objc_msgSend(*(id *)(a1 + 32), "_attributeTagForCurrentSelectionState");
  objc_msgSend(*(id *)(a1 + 32), "colorPickerPopoverViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setColorAttributeTag:", v27);

  objc_msgSend(*(id *)(a1 + 32), "syncUIToSelectedColor");
  v29 = *(void **)(a1 + 32);
  objc_msgSend(v29, "colorPickerPopoverViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "presentViewController:animated:completion:", v30, 1, 0);

  objc_msgSend(*(id *)(a1 + 32), "colorPickerPopoverViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("color"), 1, 0);

  v32 = *(void **)(a1 + 32);
  objc_msgSend(v32, "colorPickerPopoverViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_setupPassthroughViewsForViewController:", v33);

}

void sub_2290066E4(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "attributeToolbarViewControllerConstraint");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConstant:", 0.0);

  objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("AKAttributeToolbarDidShowNotification"), *(_QWORD *)(a1 + 48));

}

uint64_t sub_229006860(id *a1)
{
  double Height;
  void *v3;
  CGRect v5;

  objc_msgSend(a1[5], "frame");
  Height = CGRectGetHeight(v5);
  objc_msgSend(a1[4], "attributeToolbarViewControllerConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", Height);

  return objc_msgSend(a1[6], "layoutIfNeeded");
}

uint64_t sub_2290068B4(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "attributeToolbarViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  return objc_msgSend(*(id *)(a1 + 32), "setAttributeToolbarViewController:", 0);
}

void sub_229007394(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  AKSignatureCreationViewController_iOS *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "controllerWillShowSignatureCaptureView:", v10);
  objc_msgSend(*(id *)(a1 + 32), "signaturesSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "signaturesSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", 0);

  objc_msgSend(*(id *)(a1 + 32), "setSignaturesSheetViewController:", 0);
  v6 = -[AKSignatureCreationViewController_iOS initWithController:]([AKSignatureCreationViewController_iOS alloc], "initWithController:", v10);
  -[AKSignatureCreationViewController_iOS setModalTransitionStyle:](v6, "setModalTransitionStyle:", 0);
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
    v8 = 2;
  else
    v8 = 5;
  -[AKSignatureCreationViewController_iOS setModalPresentationStyle:](v6, "setModalPresentationStyle:", v8);

  -[AKSignatureCreationViewController_iOS setDelegate:](v6, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[AKSignatureCreationViewController_iOS setModalInPresentation:](v6, "setModalInPresentation:", 1);
  objc_msgSend(v10, "toolPicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setVisible:forFirstResponder:", 0, v6);
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v6, 1, 0);

}

void sub_229009A8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21,id a22,id a23)
{
  id *v23;
  id *v24;
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v25);
  objc_destroyWeak(location);
  objc_destroyWeak(&a21);
  objc_destroyWeak(&a22);
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v26 - 104));
  _Unwind_Resume(a1);
}

void sub_229009ADC(id *a1)
{
  id v2;
  id v3;
  id v4;
  AKInkAnnotation2 *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  double MidX;
  double MidY;
  void *v16;
  id WeakRetained;
  CGRect v18;
  CGRect v19;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v2 = objc_loadWeakRetained(a1 + 6);
  v3 = objc_loadWeakRetained(a1 + 7);
  v4 = objc_loadWeakRetained(a1 + 8);
  if (WeakRetained && v2 && v3 && v4)
  {
    v5 = objc_alloc_init(AKInkAnnotation2);
    objc_msgSend(a1[4], "bounds");
    objc_msgSend(WeakRetained, "_convertRect:fromDrawingInCanvasView:toPageControllerModelSpace:", v3, v2);
    -[AKInkAnnotation setRectangle:](v5, "setRectangle:");
    v6 = (void *)objc_msgSend(a1[4], "copy");
    -[AKInkAnnotation setDrawing:](v5, "setDrawing:", v6);

    objc_msgSend(v2, "modelBaseScaleFactor");
    -[AKAnnotation setOriginalModelBaseScaleFactor:](v5, "setOriginalModelBaseScaleFactor:");
    -[AKAnnotation setOriginalExifOrientation:](v5, "setOriginalExifOrientation:", 1);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v2, "currentModelToScreenExifOrientation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, CFSTR("com.apple.AnnotationKit.AnnotationImageHelperAdditionalExifHintKey"), v7, (void *)0x301);

    objc_msgSend(WeakRetained, "setIgnoreAnnotationAndSelectionKVO:", 1);
    objc_msgSend(a1[4], "CHDrawing");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_convertCHDrawing:fromDrawingInCanvasView:toInkOverlayView:", v8, v3, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    x = v18.origin.x;
    y = v18.origin.y;
    width = v18.size.width;
    height = v18.size.height;
    MidX = CGRectGetMidX(v18);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MidY = CGRectGetMidY(v19);
    objc_msgSend(WeakRetained, "shapeDetectionController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "performRecognitionOnDrawing:withDrawing:annotation:boundsInInputView:center:", v9, a1[4], v5, x, y, width, height, MidX, MidY);

    objc_msgSend(WeakRetained, "setIgnoreAnnotationAndSelectionKVO:", 0);
  }

}

double sub_22900AD98(void *a1)
{
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGRect v17;
  CGRect v18;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "akEnclosingScrollView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "bounds");
    objc_msgSend(v11, "convertRect:toView:", a1);
    v18.origin.x = v12;
    v18.origin.y = v13;
    v18.size.width = v14;
    v18.size.height = v15;
    v17.origin.x = v3;
    v17.origin.y = v5;
    v17.size.width = v7;
    v17.size.height = v9;
    *(_QWORD *)&v3 = (unint64_t)CGRectIntersection(v17, v18);
  }

  return v3;
}

id sub_22900AE48(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  do
  {
    v2 = v1;
    objc_msgSend(v1, "superview");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    if (!v1)
      break;
    objc_opt_class();
  }
  while ((objc_opt_isKindOfClass() & 1) == 0);
  return v1;
}

id sub_22900EE58(uint64_t a1, uint64_t a2, int a3)
{
  double v3;
  double v4;
  void *v5;
  void *v6;

  if (a3)
    v3 = 1.0;
  else
    v3 = 0.97;
  if (a3)
    v4 = 0.5;
  else
    v4 = -1.0;
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE33B0], "inkWithIdentifier:color:weight:", *MEMORY[0x24BDE3438], v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id sub_22900EEE8(double a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  void *v7;
  id v8;
  id v9;
  void *v10;

  v7 = (void *)MEMORY[0x24BDE33B0];
  v8 = a5;
  v9 = a4;
  objc_msgSend(v7, "inkWeightFromAKValue:", a1);
  objc_msgSend(MEMORY[0x24BDE33B0], "inkWithIdentifier:color:weight:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id sub_22900EF60(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDE33B0];
  v6 = a4;
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inkFromInk:color:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDE33B0], "inkWeightFromAKValue:", a1);
  objc_msgSend(v8, "setWeight:");
  return v8;
}

id sub_22900EFE0(double a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDE33B0], "inkFromInk:color:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDE33B0], "inkWeightFromAKValue:", a1);
  objc_msgSend(v2, "setWeight:");
  return v2;
}

double sub_22900F030(double a1)
{
  double v1;
  double v2;

  v1 = (a1 + -1.0) * 0.142857143 + -1.0;
  v2 = 1.0;
  if (v1 <= 1.0)
    v2 = v1;
  if (v1 >= -1.0)
    return v2;
  else
    return -1.0;
}

void sub_229010460(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(*(id *)(a1 + 32), "rectangle");
    objc_msgSend(*(id *)(a1 + 32), "setRectangle:");
    WeakRetained = v3;
  }

}

void sub_229011AA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_229011AD4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_229011AE4(uint64_t a1)
{

}

void sub_229011AEC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  dispatch_group_leave((dispatch_group_t)qword_255A27050);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_229011B80()
{
  void *v0;

  v0 = (void *)qword_255A27048;
  qword_255A27048 = 0;

  NSLog(CFSTR("Purged shared renderer due to memory pressure."));
}

void sub_229011F14(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t sub_2290123C4()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  byte_255A27060 = result;
  return result;
}

void sub_229012428()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_255A27070 = objc_msgSend(v0, "_supportsForceTouch");

}

void sub_2290124A4()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arguments");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    byte_255A27080 = objc_msgSend(v1, "containsString:", CFSTR(".appex/"));

}

id sub_229014DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;
  void *v10;

  v8 = (void *)MEMORY[0x24BDF6B10];
  v9 = a5;
  objc_msgSend(v8, "keyCommandWithInput:modifierFlags:action:", a2, a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDiscoverabilityTitle:", v9);

  return v10;
}

BOOL sub_2290159EC(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

void sub_229015B5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_229015B74(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

BOOL sub_229015E14(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL sub_229016194(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

BOOL sub_229016390(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

uint64_t sub_229018214(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_akToolbarButtonItemType);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 0x7FFFFFFFFFFFFFFFLL;

  return v2;
}

uint64_t sub_22901973C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openPopoverForHighlightAnnotation:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_22901A9C4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("characterIndexes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("characterIndexes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "firstIndex");
  if (v7 <= objc_msgSend(v6, "firstIndex"))
  {
    v9 = objc_msgSend(v5, "firstIndex");
    if (v9 >= objc_msgSend(v6, "firstIndex"))
      v8 = 0;
    else
      v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

uint64_t sub_22901AA70(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("annotation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characterIndexes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "style");
  if (v9 == objc_msgSend(*(id *)(a1 + 32), "style"))
    v10 = objc_msgSend(v8, "containsIndex:", objc_msgSend(*(id *)(a1 + 40), "firstIndex"));
  else
    v10 = 0;
  *a4 = v10;

  return v10;
}

uint64_t sub_22901AB24(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a2;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("annotation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characterIndexes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "style");
  if (v9 == objc_msgSend(*(id *)(a1 + 32), "style"))
    v10 = objc_msgSend(v8, "containsIndex:", objc_msgSend(*(id *)(a1 + 40), "lastIndex"));
  else
    v10 = 0;
  *a4 = v10;

  return v10;
}

double sub_22901BCE4(float64x2_t *a1, double a2, double a3)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&vaddq_f64(a1[4], vmlaq_n_f64(vmulq_n_f64(a1[3], a3), a1[2], a2));
  return result;
}

BOOL sub_22901C04C(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  v2 = objc_msgSend(v1, "horizontalSizeClass") == 2 && objc_msgSend(v1, "verticalSizeClass") == 2;

  return v2;
}

BOOL sub_22901C098(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "horizontalSizeClass");
  if (v5 == objc_msgSend(v4, "horizontalSizeClass"))
  {
    v6 = objc_msgSend(v3, "verticalSizeClass");
    v7 = v6 == objc_msgSend(v4, "verticalSizeClass");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_22901ED4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22901EE1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22901EEE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22901EFC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22901F074(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id sub_22901F124()
{
  if (qword_255A270B8 != -1)
    dispatch_once(&qword_255A270B8, &unk_24F1A71D8);
  return (id)qword_255A270C0;
}

void sub_22901F164(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  _BOOL4 v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  xmlDoc *Memory;
  void *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  const __CFString *v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!qword_255A270A0
    || (objc_msgSend((id)qword_255A270A0, "objectForKey:", *(_QWORD *)(a1 + 32)),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        !v2))
  {
    +[AKTSDBrushStroke cacheDirectory](AKTSDBrushStroke, "cacheDirectory");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (!qword_255A27098)
    {
      v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v4 = (void *)qword_255A27098;
      qword_255A27098 = (uint64_t)v3;

      v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v6 = (void *)qword_255A270A0;
      qword_255A270A0 = (uint64_t)v5;

      v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v8 = (void *)qword_255A270A8;
      qword_255A270A8 = (uint64_t)v7;

      v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      v10 = (void *)qword_255A270B0;
      qword_255A270B0 = (uint64_t)v9;

      objc_msgSend(v34, "stringByAppendingString:", CFSTR("/TSDBrushCacheVersion.txt"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v11, 4, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), 9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12 || (objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v34, &v39);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v39;

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v16 = v15;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v36 != v18)
                objc_enumerationMutation(v16);
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "hasPrefix:", CFSTR("TSDBrush"));
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
          }
          while (v17);
        }

        objc_msgSend(v13, "writeToFile:atomically:encoding:error:", v11, 0, 4, 0);
      }

    }
    objc_msgSend((id)qword_255A270A0, "objectForKey:", *(_QWORD *)(a1 + 32));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (v21)
    {
      objc_msgSend(CFSTR("TSDBrush_"), "stringByAppendingString:", *(_QWORD *)(a1 + 32));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_alloc(MEMORY[0x24BDF6718]);
      +[AKController akBundle](AKController, "akBundle");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithName:bundle:", v22, v24);

      objc_msgSend(v25, "data");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "length");
      if (!((unint64_t)objc_msgSend(v26, "length") >> 31))
      {
        Memory = xmlReadMemory((const char *)objc_msgSend(objc_retainAutorelease(v26), "bytes"), v27, "", 0, 1);
        sub_22901F644(Memory, CFSTR("//svg:split-at-sharp-angles[1]"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "count") != 0;

        v40 = CFSTR("split-at-sharp-angles");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v31;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)qword_255A270A0, "setObject:forKeyedSubscript:", v32, *(_QWORD *)(a1 + 32));

        +[AKTSDBrushStroke loadLineEndsForBrush:inSVGDoc:](AKTSDBrushStroke, "loadLineEndsForBrush:inSVGDoc:", *(_QWORD *)(a1 + 32), Memory);
        +[AKTSDBrushStroke loadSectionsForBrush:inSVGDoc:](AKTSDBrushStroke, "loadSectionsForBrush:inSVGDoc:", *(_QWORD *)(a1 + 32), Memory);
        xmlFreeDoc(Memory);
      }

    }
  }
}

void sub_22901F568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

id sub_22901F644(xmlDoc *a1, void *a2)
{
  id v3;
  xmlXPathContext *v4;
  xmlXPathContext *v5;
  uint64_t v6;
  xmlXPathObject *v7;
  int *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  v4 = xmlXPathNewContext(a1);
  v5 = v4;
  if (!v4)
  {
    NSLog(CFSTR("Unable to create XPath context."));
LABEL_12:
    v9 = 0;
    goto LABEL_13;
  }
  xmlXPathRegisterNs(v4, (const xmlChar *)"svg", (const xmlChar *)"http://www.w3.org/2000/svg");
  v6 = MEMORY[0x22E2C14D4](objc_msgSend(objc_retainAutorelease(v3), "cStringUsingEncoding:", 4), v5);
  v7 = (xmlXPathObject *)v6;
  if (!v6)
  {
    NSLog(CFSTR("Unable to evaluate XPath."));
    goto LABEL_12;
  }
  v8 = *(int **)(v6 + 8);
  if (!v8)
  {
    NSLog(CFSTR("Nodes was nil."));
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (*v8 >= 1)
  {
    v10 = 0;
    do
    {
      sub_229021E7C(*(_QWORD **)(*((_QWORD *)v8 + 1) + 8 * v10), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v9, "addObject:", v11);

      ++v10;
    }
    while (v10 < *v8);
  }
  xmlXPathFreeObject(v7);
  xmlXPathFreeContext(v5);
LABEL_13:

  return v9;
}

void sub_22901F778(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22901FD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_2290203D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_229020640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_22902065C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22902066C(uint64_t a1)
{

}

void sub_229020674(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)qword_255A270A8, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_2290207C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2290207E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)qword_255A270B0, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_229020A00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_229020A38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)qword_255A27098, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_229020C0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229020D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_229020E24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229020F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_229021608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, id a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_229021C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  void *v16;
  void *v17;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_229021C8C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)qword_255A270A0;
  objc_msgSend(*(id *)(a1 + 32), "strokeName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("split-at-sharp-angles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "BOOLValue");

}

void sub_229021D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

id sub_229021E7C(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  void *v21;
  char v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[2];
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5, 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("nodeName"));

  }
  if ((unint64_t)(a1[10] + 1) >= 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("nodeName"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqual:", CFSTR("text"));

    v23 = v22 ^ 1;
    if (!v3)
      v23 = 1;
    if ((v23 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringByTrimmingCharactersInSet:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "objectForKey:", CFSTR("nodeContent"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        objc_msgSend(v26, "stringByAppendingString:", v25);
        v28 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = v25;
      }
      v29 = v28;
      objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("nodeContent"));

      v18 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("nodeContent"));

  }
  v7 = (_QWORD *)a1[11];
  if (v7)
  {
    v30 = v3;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7[2], 4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v7[3];
      if (v11)
        v12 = (id)sub_229021E7C(v11, v9);
      if (v10)
      {
        objc_msgSend(v9, "objectForKey:", CFSTR("nodeContent"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v9, "objectForKey:", CFSTR("nodeContent"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v14, v10);

        }
      }
      v7 = (_QWORD *)v7[6];

    }
    while (v7);
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("nodeAttributes"));

    v3 = v30;
  }
  v15 = a1[3];
  if (v15)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      sub_229021E7C(v15, v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v16, "addObject:", v17);
      v15 = *(_QWORD *)(v15 + 48);

    }
    while (v15);
    if (objc_msgSend(v16, "count"))
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("nodeChildArray"));

  }
  v18 = v4;
LABEL_22:

  return v18;
}

void sub_229022180(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22902223C()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AKTSDBrushStrokeLoadQueue", 0);
  v1 = (void *)qword_255A270C0;
  qword_255A270C0 = (uint64_t)v0;

}

uint64_t sub_229022664(void *a1)
{
  return objc_msgSend(objc_retainAutorelease(a1), "CGImage");
}

id sub_229022678(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = a3;
  +[AKController akBundle](AKController, "akBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void sub_2290226E8(void *a1, uint64_t a2, UIImage *a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  UIImagePNGRepresentation(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v7, v6);

}

id sub_229022748(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v5);
  return v6;
}

uint64_t sub_229023280(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t sub_229023430(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

void sub_229023CAC(uint64_t a1, void *a2)
{
  id v3;
  AKPageModelController *v4;

  v3 = a2;
  v4 = -[AKPageModelController initWithArchivableRepresentation:]([AKPageModelController alloc], "initWithArchivableRepresentation:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

double sub_229023D1C(void *a1)
{
  float v1;

  objc_msgSend(a1, "value");
  return v1;
}

uint64_t sub_229023D34(void *a1, const char *a2, double a3)
{
  *(float *)&a3 = a3;
  return objc_msgSend(a1, "setValue:", a3);
}

double sub_229023D3C(void *a1)
{
  float v1;

  objc_msgSend(a1, "minimumValue");
  return v1;
}

uint64_t sub_229023D54(void *a1, const char *a2, double a3)
{
  *(float *)&a3 = a3;
  return objc_msgSend(a1, "setMinimumValue:", a3);
}

double sub_229023D5C(void *a1)
{
  float v1;

  objc_msgSend(a1, "maximumValue");
  return v1;
}

uint64_t sub_229023D74(void *a1, const char *a2, double a3)
{
  *(float *)&a3 = a3;
  return objc_msgSend(a1, "setMaximumValue:", a3);
}

double sub_229025E90(uint64_t a1, double a2, double a3)
{
  void *v5;
  double v6;
  double v7;

  objc_msgSend(*(id *)(a1 + 32), "overlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", 0, a2, a3);
  v7 = v6;

  return v7;
}

void sub_22902666C(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if (*(_BYTE *)(a1 + 56))
    v7 = v6 == 0;
  else
    v7 = 0;
  if (!v7)
  {
    objc_msgSend(v18, "akPointValue");
    v9 = v8;
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 40), "geometryHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "handleContainerLayer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertPoint:fromModelToLayer:", v13, v9, v11);
    v15 = v14;
    v17 = v16;

    objc_msgSend(*(id *)(a1 + 48), "_addHandleSublayerAtPoint:withStyle:", v6, v15, v17);
  }

}

void sub_229026748(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v5 = *(void **)(a1 + 32);
  v17 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "akPointValue");
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 40), "geometryHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "handleContainerLayer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertPoint:fromModelToLayer:", v12, v8, v10);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v17, "setPosition:", v14, v16);
}

void sub_2290273B8(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "highlight");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_22902B22C(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "annotation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "p_removeAnnotation:", v2);

}

void sub_22902B690(uint64_t a1)
{
  void (**v1)(_QWORD, _QWORD);
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_22902B7A4;
  v12[3] = &unk_24F1A7E00;
  v12[4] = *(_QWORD *)(a1 + 32);
  v1 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2C12D0](v12);
  v1[2](v1, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_255A270D0;
  qword_255A270D0 = v2;

  v1[2](v1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_255A270D8;
  qword_255A270D8 = v4;

  v1[2](v1, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_255A270E0;
  qword_255A270E0 = v6;

  v1[2](v1, 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_255A270E8;
  qword_255A270E8 = v8;

  v1[2](v1, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_255A270F0;
  qword_255A270F0 = v10;

}

id sub_22902B7A4(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[6];
  _QWORD v19[7];

  v19[6] = *MEMORY[0x24BDAC8D0];
  v18[0] = &unk_24F1CFC00;
  objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 1, a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "highlightColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  v18[1] = &unk_24F1CFC18;
  objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 2, a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "highlightColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v4;
  v18[2] = &unk_24F1CFC30;
  objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 3, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "highlightColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v6;
  v18[3] = &unk_24F1CFC48;
  objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlightColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v8;
  v18[4] = &unk_24F1CFC60;
  objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 5, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "highlightColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v10;
  v18[5] = &unk_24F1CFC78;
  objc_msgSend(*(id *)(a1 + 32), "p_themeForStyle:pageTheme:", 6, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "noteFillColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_22902BCFC(uint64_t a1)
{
  void (**v1)(_QWORD, _QWORD);
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_22902BE10;
  v12[3] = &unk_24F1A7E00;
  v12[4] = *(_QWORD *)(a1 + 32);
  v1 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2C12D0](v12);
  v1[2](v1, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_255A27100;
  qword_255A27100 = v2;

  v1[2](v1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_255A27108;
  qword_255A27108 = v4;

  v1[2](v1, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_255A27110;
  qword_255A27110 = v6;

  v1[2](v1, 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_255A27118;
  qword_255A27118 = v8;

  v1[2](v1, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_255A27120;
  qword_255A27120 = v10;

}

id sub_22902BE10(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v22[0] = &unk_24F1CFC00;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "p_colorForTag:pageTheme:", 1, a2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "p_colorControlImageForColor:", v21);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v20;
  v22[1] = &unk_24F1CFC18;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "p_colorForTag:pageTheme:", 2, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "p_colorControlImageForColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  v22[2] = &unk_24F1CFC30;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v8, "p_colorForTag:pageTheme:", 3, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "p_colorControlImageForColor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v10;
  v22[3] = &unk_24F1CFC48;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "p_colorForTag:pageTheme:", 4, a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "p_colorControlImageForColor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v13;
  v22[4] = &unk_24F1CFC60;
  v14 = *(void **)(a1 + 32);
  objc_msgSend(v14, "p_colorForTag:pageTheme:", 5, a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "p_colorControlImageForColor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v16;
  v22[5] = &unk_24F1CFC78;
  objc_msgSend(*(id *)(a1 + 32), "p_colorControlUnderlineImageForPageTheme:", a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void sub_22902C640(uint64_t a1)
{
  void (**v1)(_QWORD, _QWORD);
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = sub_22902C754;
  v12[3] = &unk_24F1A7E00;
  v12[4] = *(_QWORD *)(a1 + 32);
  v1 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2C12D0](v12);
  v1[2](v1, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_255A27130;
  qword_255A27130 = v2;

  v1[2](v1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_255A27138;
  qword_255A27138 = v4;

  v1[2](v1, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_255A27140;
  qword_255A27140 = v6;

  v1[2](v1, 2);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_255A27148;
  qword_255A27148 = v8;

  v1[2](v1, 3);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)qword_255A27150;
  qword_255A27150 = v10;

}

id sub_22902C754(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[6];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x24BDAC8D0];
  v12[0] = &unk_24F1CFC00;
  objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 1, 2, 3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v12[1] = &unk_24F1CFC18;
  objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 2, 3, 5, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v5;
  v12[2] = &unk_24F1CFC30;
  objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 3, 4, 5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v6;
  v12[3] = &unk_24F1CFC48;
  objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 4, 5, 2, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v7;
  v12[4] = &unk_24F1CFC60;
  objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 5, 1, 2, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[4] = v8;
  v12[5] = &unk_24F1CFC78;
  objc_msgSend(*(id *)(a1 + 32), "p_buildPaletteImageForFrontTag:middleTag:backTag:pageTheme:", 6, 2, 3, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_22902CB58(uint64_t a1)
{
  void *v2;
  id v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  objc_msgSend(MEMORY[0x24BDF6AC8], "akImageNamed:", CFSTR("ib_text_pop_icon_note"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_22902CC9C;
  v15[3] = &unk_24F1A7E28;
  v15[4] = *(_QWORD *)(a1 + 32);
  v16 = v2;
  v3 = v2;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2C12D0](v15);
  v4[2](v4, 4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_255A27160;
  qword_255A27160 = v5;

  v4[2](v4, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_255A27168;
  qword_255A27168 = v7;

  v4[2](v4, 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)qword_255A27170;
  qword_255A27170 = v9;

  v4[2](v4, 2);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)qword_255A27178;
  qword_255A27178 = v11;

  v4[2](v4, 3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)qword_255A27180;
  qword_255A27180 = v13;

}

id sub_22902CC9C(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[6];
  _QWORD v31[7];

  v31[6] = *MEMORY[0x24BDAC8D0];
  v30[0] = &unk_24F1CFC00;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "p_colorForTag:pageTheme:", 1, a2);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "p_monochromaticImageFromImage:withColor:", v5, v29);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v28;
  v30[1] = &unk_24F1CFC18;
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v6, "p_colorForTag:pageTheme:", 2, a2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "p_monochromaticImageFromImage:withColor:", v7, v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v26;
  v30[2] = &unk_24F1CFC30;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v8, "p_colorForTag:pageTheme:", 3, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "p_monochromaticImageFromImage:withColor:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v11;
  v30[3] = &unk_24F1CFC48;
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v12, "p_colorForTag:pageTheme:", 4, a2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "p_monochromaticImageFromImage:withColor:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v15;
  v30[4] = &unk_24F1CFC60;
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v16, "p_colorForTag:pageTheme:", 5, a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "p_monochromaticImageFromImage:withColor:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v19;
  v30[5] = &unk_24F1CFC78;
  v20 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v20, "p_colorForTag:pageTheme:", 6, a2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "p_monochromaticImageFromImage:withColor:", v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v31[5] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

double sub_22902DEE4(double a1, double a2, double a3)
{
  return a1 + a3;
}

double sub_22902DEF0(double a1, double a2, double a3)
{
  return a1 - a3;
}

double sub_22902DEFC(double a1, double a2, double a3)
{
  return a1 * a3;
}

double sub_22902DF08(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double sub_22902DF18(double a1, double a2)
{
  return a2 * a2 + a1 * a1;
}

double sub_22902DF24(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double sub_22902DF3C(double a1, double a2)
{
  return a1 * (1.0 / sqrt(a2 * a2 + a1 * a1));
}

double sub_22902DF5C(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double sub_22902DF68(long double a1, long double a2)
{
  return atan2(a2, a1);
}

double sub_22902DF78(double a1)
{
  if (a1 == 0.0)
    return 1.0;
  return __sincos_stret(a1).__cosval;
}

double sub_22902DFAC(int a1, double a2, double a3)
{
  if (a1)
    return -a3;
  else
    return a3;
}

void sub_22902E138(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22902E204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)AKLegacyDoodleController;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_22902E240(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_22902E2CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22902E508(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_22902E688(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22902E9F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_22902EB7C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22902EBF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22902EC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22902ECC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22902EDA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_22902EE0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22902EE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22902EEA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22902EFAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22902F1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_22902F32C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  objc_destroyWeak((id *)(v2 - 104));

  _Unwind_Resume(a1);
}

void sub_22902F360(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v4;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "shapeDetectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "performRecognitionOnDrawing:withPath:boundsInInputView:center:isPrestroked:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 104), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));

  }
  CGPathRelease(*(CGPathRef *)(a1 + 48));
}

void sub_22902F3C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22902F448(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22902F618(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22902F868(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_22902F940(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22902F9E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22902FD84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_22902FEC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2290301D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,void *a30)
{
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

BOOL sub_2290302B4(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _BOOL8 v6;
  void *v7;

  v3 = a2;
  if (objc_msgSend(a1[4], "containsObject:", v3))
  {
    objc_msgSend(a1[5], "shapeDetectionController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "candidateAnnotation");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v5 != v3;
    if (v5 == v3)
    {
      objc_msgSend(a1[5], "shapeDetectionController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIsPreviousCandidateAnnotationUndecided:", 1);

    }
    objc_msgSend(a1[6], "removeObject:", v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_229030358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL sub_2290321B8()
{
  unsigned int (*v0)(_QWORD);
  _Unwind_Exception *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (unsigned int (*)(_QWORD))off_255A27190;
  v7 = off_255A27190;
  if (!off_255A27190)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = sub_229032420;
    v3[3] = &unk_24F1A7890;
    v3[4] = &v4;
    sub_229032420((uint64_t)v3);
    v0 = (unsigned int (*)(_QWORD))v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v2 = (_Unwind_Exception *)sub_22907F950();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return v0(0) - 1 < 2;
}

void *sub_229032420(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_255A27198)
  {
    v2 = (void *)qword_255A27198;
  }
  else
  {
    qword_255A27198 = _sl_dlopen();
    v2 = (void *)qword_255A27198;
    if (!qword_255A27198)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_255A27190 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__n128 sub_22903341C(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v17;
  double v18;
  float64x2_t v19;
  CGAffineTransform v20;

  objc_msgSend(*(id *)(a1 + 32), "convertPointFromModelToOverlay:");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 40), "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "convertPoint:toView:", v6, v3, v5);
  v8 = v7;
  v10 = v9;
  objc_msgSend(v6, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v13, v8, v10);
  v17 = v15;
  v18 = v14;

  CGAffineTransformMakeScale(&v20, 1.0, -1.0);
  v19 = vaddq_f64(*(float64x2_t *)&v20.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v20.c, v17), *(float64x2_t *)&v20.a, v18));

  return (__n128)v19;
}

uint64_t sub_2290346A4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openPopupAnnotation:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_229034A1C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "openPopupAnnotation:", *(_QWORD *)(a1 + 40));
}

void sub_2290352DC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_229036500(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "signaturesAlertViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_229036578;
  v3[3] = &unk_24F1A7328;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t sub_229036578(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSignaturesAlertViewController:", 0);
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__continueToManageSignatures);
}

void sub_2290365A4(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "signaturesAlertViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = sub_22903661C;
  v3[3] = &unk_24F1A7328;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, v3);

}

uint64_t sub_22903661C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSignaturesSheetViewController:", 0);
}

uint64_t sub_2290367FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSignaturesSheetViewController:", 0);
}

uint64_t sub_2290368B4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSignaturesSheetViewController:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_continueToCreateSignature");
}

uint64_t sub_229036AB0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSignaturesCreationViewController:", 0);
}

uint64_t sub_22903EAB8(double a1, double a2, double a3, double a4)
{
  return objc_msgSend((id)objc_opt_class(), "stableIntegralRectForRect:", a1, a2, a3, a4);
}

void sub_22903EC3C(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6)
{
  CGRect v10;

  vabdd_f64(1.0, fmod(round(*(double *)(a1 + 32) * a6), 2.0));
  v10.origin.x = a2;
  v10.origin.y = a3;
  v10.size.width = a4;
  v10.size.height = a5;
  CGRectIntegral(v10);
}

uint64_t sub_22903EDA4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "integralRect:withOptions:", 983040);
}

void sub_22903F1E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22903F25C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22903F2C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22903F3EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22903F464(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22903F788(_Unwind_Exception *a1)
{
  id *v1;
  void *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_22903F7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *i;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "bitmapFifo");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
  {
    if (COERCE_FLOAT(*(_QWORD *)(a2 + 8)) > 0.00001)
      objc_msgSend(i, "addPoint:", *(double *)a2);
    a2 += 16;
  }
  if ((objc_msgSend(WeakRetained, "isAddingPointWithoutSmoothing") & 1) == 0)
    objc_msgSend(WeakRetained, "setDisableSingleDotSpecialCase:", 1);

}

void sub_22903F8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22903F8F8(uint64_t a1, __int128 *a2, uint64_t a3)
{
  double v5;
  double v6;
  __int128 v7;
  double v8;
  double *v9;
  double v10;
  double v11;
  double v12;
  double *WeakRetained;

  WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "isAddingPointWithoutSmoothing") & 1) != 0)
  {
    v5 = WeakRetained[52];
    v6 = WeakRetained[53];
    if (a3 != 1)
      NSLog(CFSTR("%s: Single dot special case should only ever receive 1 point."), "-[AKSmoothPathView _setupFilterChainWithBitmapFifo:]_block_invoke_2");
    v7 = *a2;
    v8 = COERCE_FLOAT(*((_QWORD *)a2 + 1));
    v9 = WeakRetained;
    if (v8 > 0.00001)
    {
      v10 = v6 * (v5 * v8);
      v11 = *(float *)&v7 - v10 * 0.5;
      v12 = *((float *)&v7 + 1) - v10 * 0.5;
      objc_msgSend(WeakRetained, "setSingleDotRect:", v11, v12, v10, v10);
      objc_msgSend(WeakRetained, "setNeedsDisplayInRect:", v11, v12, v10, v10);
      v9 = WeakRetained;
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "setDisableSingleDotSpecialCase:", 1);
    v9 = WeakRetained;
  }

}

void sub_22903FA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22903FA80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22903FC30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22903FCE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22903FDE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22903FE38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229040344(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22904055C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_229040634(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_2290406E4(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_callDelegate);
}

void sub_22904077C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2290408C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2290409C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t sub_229040A94(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "minPressure");
  qword_255A271A8 = v2;
  objc_msgSend(*(id *)(a1 + 32), "maxPressure");
  qword_255A271B0 = v3;
  objc_msgSend(*(id *)(a1 + 32), "minThickness");
  qword_255A271B8 = v4;
  result = objc_msgSend(*(id *)(a1 + 32), "maxThickness");
  qword_255A271C0 = v6;
  return result;
}

void sub_229040C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_229040D34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_229040DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229040F14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_229041014(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_229041160(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_229041224(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2290412D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_22904201C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_229042034(uint64_t a1, int a2, CGPathRef path)
{
  CGRect BoundingBox;

  BoundingBox = CGPathGetBoundingBox(path);
  *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32), BoundingBox);
  return 0;
}

uint64_t sub_2290421B0(uint64_t a1, int a2, CGPathRef path)
{
  CGContextAddPath(*(CGContextRef *)(a1 + 32), path);
  CGContextEOFillPath(*(CGContextRef *)(a1 + 32));
  return 0;
}

void sub_2290422AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2290422C4(uint64_t a1, int a2, CGPathRef path)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGPathContainsPoint(path, 0, *(CGPoint *)(a1 + 40), 1);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void sub_22904375C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_22904377C(void *a1, int a2)
{
  id v3;

  v3 = objc_begin_catch(a1);
  if (a2 == 2)
  {
    sub_22907FC64(v3);
    JUMPOUT(0x22904370CLL);
  }
  JUMPOUT(0x229043714);
}

void sub_229043D74()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F1CF5A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_255A271C8;
  qword_255A271C8 = v0;

}

void sub_229043DA8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 32) && !*((_BYTE *)WeakRetained + 33))
  {
    *((_BYTE *)WeakRetained + 33) = 1;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_msgSend((id)qword_255A271C8, "containsObject:", v9, (_QWORD)v10) & 1) == 0)
            objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v3, v9, 3, CFSTR("AKAnnotation.annotationPropertyObservationForIsEditedContext"));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

void sub_229044214()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24F1CF5B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_255A271D8;
  qword_255A271D8 = v0;

}

void sub_229044248(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && *((_BYTE *)WeakRetained + 16) && !*((_BYTE *)WeakRetained + 17))
  {
    *((_BYTE *)WeakRetained + 17) = 1;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          if ((objc_msgSend((id)qword_255A271D8, "containsObject:", v9, (_QWORD)v10) & 1) == 0)
            objc_msgSend(v3, "addObserver:forKeyPath:options:context:", v3, v9, 3, CFSTR("AKAnnotation.annotationPropertyObservationForAppearanceContext"));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

void sub_229044F50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229044F70(uint64_t a1, CGContext *a2)
{
  CGPDFDocumentRef *WeakRetained;
  CGPDFPage *Page;
  CGPDFDocumentRef *v5;

  WeakRetained = (CGPDFDocumentRef *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    Page = CGPDFDocumentGetPage(WeakRetained[3], 1uLL);
    CGContextDrawPDFPage(a2, Page);
    WeakRetained = v5;
  }

}

void sub_2290459F8()
{
  NSLog(CFSTR("We're trying to skip the PKDrawing for the fast path, but we don't have a CGPath!"));
}

id sub_229045B60(void *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "indexPathForSelectedRow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "cellForRowAtIndexPath:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void sub_229046D84(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v12 = a7;
  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "addSubview:", v12);
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "leadingAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:constant:", v14, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v16) = 1148829696;
  objc_msgSend(v15, "setPriority:", v16);
  objc_msgSend(v12, "trailingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, a5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v20) = 1148829696;
  objc_msgSend(v19, "setPriority:", v20);
  objc_msgSend(v12, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, a2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = 1148829696;
  objc_msgSend(v23, "setPriority:", v24);
  objc_msgSend(v12, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:constant:", v26, a4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v28) = 1148829696;
  objc_msgSend(v27, "setPriority:", v28);
  v29 = (void *)MEMORY[0x24BDD1628];
  v31[0] = v15;
  v31[1] = v19;
  v31[2] = v23;
  v31[3] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateConstraints:", v30);

}

id sub_22904BB80(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("client");
  objc_msgSend(*(id *)(a1 + 32), "clientPrefix");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (const __CFString *)v2;
  else
    v4 = CFSTR("<nil>");
  v12[0] = v4;
  v11[1] = CFSTR("documentType");
  objc_msgSend(*(id *)(a1 + 32), "documentType");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("<nil>");
  v11[2] = CFSTR("action");
  v8 = *(const __CFString **)(a1 + 40);
  if (!v8)
    v8 = CFSTR("<nil>");
  v12[1] = v7;
  v12[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_22904BCF0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v11[0] = CFSTR("client");
  objc_msgSend(*(id *)(a1 + 32), "clientPrefix");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (const __CFString *)v2;
  else
    v4 = CFSTR("<nil>");
  v12[0] = v4;
  v11[1] = CFSTR("documentType");
  objc_msgSend(*(id *)(a1 + 32), "documentType");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("<nil>");
  v12[1] = v7;
  v12[2] = CFSTR("pick");
  v11[2] = CFSTR("action");
  v11[3] = CFSTR("annotationType");
  v8 = *(const __CFString **)(a1 + 40);
  if (!v8)
    v8 = CFSTR("<nil>");
  v12[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id sub_22904BE7C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("client");
  objc_msgSend(*(id *)(a1 + 32), "clientPrefix");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (const __CFString *)v2;
  else
    v4 = CFSTR("<nil>");
  v14[0] = v4;
  v13[1] = CFSTR("documentType");
  objc_msgSend(*(id *)(a1 + 32), "documentType");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("<nil>");
  v14[1] = v7;
  v14[2] = CFSTR("create");
  v13[2] = CFSTR("action");
  v13[3] = CFSTR("annotationType");
  v9 = *(const __CFString **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  if (!v9)
    v9 = CFSTR("<nil>");
  v14[3] = v9;
  v13[4] = CFSTR("annotationCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t sub_22904F624(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_convertPointToScreenBacking:");
}

void sub_2290503B0(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "visualEffectView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", v2);

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "visualEffectView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEffect:", v5);

}

uint64_t sub_229050430(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_229050B50(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setSelected:", 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithWhite:alpha:", 1.0, 0.4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  if (*(_BYTE *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v5);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(a1 + 40);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDF6950], "clearColor", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setBackgroundColor:", v12);

        if (*(_BYTE *)(a1 + 48))
        {
          objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setTintColor:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

uint64_t sub_229050CFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_229050EBC(void *a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  int v7;
  id v8;

  v6 = a3;
  v7 = objc_msgSend(a1, "_isScrollingToTop");
  objc_msgSend(a1, "_swizzled_scrollViewAnimationEnded:finished:", v6, a4);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("AKScrollViewDidScrollToTopNotification"), a1);

  }
}

void sub_229050F7C()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  objc_class *v2;
  objc_method *v3;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__scrollViewAnimationEnded_finished_);
  v2 = (objc_class *)objc_opt_class();
  v3 = class_getInstanceMethod(v2, sel__swizzled_scrollViewAnimationEnded_finished_);
  method_exchangeImplementations(InstanceMethod, v3);
}

void sub_229052D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_229052D84(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_229052D94(uint64_t a1)
{

}

void sub_229052D9C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CGRect v29;

  v7 = *(void **)(a1 + 32);
  objc_msgSend(a2, "akPointValue");
  objc_msgSend(v7, "convertPointFromModelToOverlay:");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(*(id *)(a1 + 32), "currentModelToScreenScaleFactor");
  v15 = 1.0 / v14;
  if (v13 == 1)
  {
    v16 = &AKPointOfInterestRadius_Handle_Alternate;
    goto LABEL_5;
  }
  if (!v13)
  {
    v16 = &AKPointOfInterestSize_Handle;
LABEL_5:
    +[AKGeometryHelper rectWithSize:centeredAtPoint:](AKGeometryHelper, "rectWithSize:centeredAtPoint:", v15 * *(double *)v16, v15 * *(double *)v16, v9, v11);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    goto LABEL_7;
  }
  v18 = *MEMORY[0x24BDBF090];
  v20 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v22 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v24 = *(double *)(MEMORY[0x24BDBF090] + 24);
LABEL_7:
  v29.origin.x = v18;
  v29.origin.y = v20;
  v29.size.width = v22;
  v29.size.height = v24;
  if (CGRectContainsPoint(v29, *(CGPoint *)(a1 + 64)))
  {
    v25 = *(CGFloat **)(*(_QWORD *)(a1 + 48) + 8);
    v25[4] = v18;
    v25[5] = v20;
    v25[6] = v22;
    v25[7] = v24;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v26;

    *a4 = 1;
  }
}

uint64_t sub_229053284(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "removeFromSuperview");
}

void sub_229053C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229053CB8(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_removeLiftOffHandleViewForRegion:", *(_QWORD *)(a1 + 32));

  }
}

id sub_229055D58(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGColorSpace *v8;
  CGColorSpace *v9;
  CGColorRef v10;
  CGColorRef v11;
  void *v12;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  v8 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  if (v8)
  {
    v9 = v8;
    components[0] = a1;
    components[1] = a2;
    components[2] = a3;
    components[3] = a4;
    v10 = CGColorCreate(v8, components);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v11);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v9);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

id sub_229055E38(CGFloat a1, CGFloat a2)
{
  CGColorSpace *v4;
  CGColorSpace *v5;
  CGColorRef v6;
  CGColorRef v7;
  void *v8;
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF290]);
  if (v4)
  {
    v5 = v4;
    components[0] = a1;
    components[1] = a2;
    v6 = CGColorCreate(v4, components);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

id sub_229055F04(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  double v8;
  double v9;
  double v10;
  double v11;

  v3 = (objc_class *)MEMORY[0x24BDF6950];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCIColor:", v4);

  v10 = 0.0;
  v11 = 0.0;
  v8 = 1.0;
  v9 = 0.0;
  objc_msgSend(v5, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);
  objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", v11, v10, v9, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t sub_229055F9C()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.08);
}

uint64_t sub_229055FBC()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.0, 0.450980392, 0.858823529, 1.0);
}

uint64_t sub_229055FE0()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_systemRedColor);
}

uint64_t sub_229055FEC()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_systemYellowColor);
}

uint64_t sub_229055FF8()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_systemGreenColor);
}

uint64_t sub_229056004()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
}

uint64_t sub_229056010()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_systemPinkColor);
}

uint64_t sub_22905601C()
{
  return MEMORY[0x24BEDD108](MEMORY[0x24BDF6950], sel_systemPurpleColor);
}

uint64_t sub_229056028()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithWhite:alpha:", 0.901961, 1.0);
}

uint64_t sub_229056040()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.988235294, 0.192156863, 0.258823529, 1.0);
}

uint64_t sub_229056068()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 1.0, 0.584313725, 0.0, 1.0);
}

uint64_t sub_229056088()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 1.0, 0.8, 0.0, 1.0);
}

uint64_t sub_2290560A8()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.388235294, 0.854901961, 0.219607843, 1.0);
}

uint64_t sub_2290560D0()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.105882353, 0.678431373, 0.97254902, 1.0);
}

uint64_t sub_2290560F8()
{
  return objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", 0.8, 0.450980392, 0.882352941, 1.0);
}

double sub_229056120(void *a1)
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getWhite:alpha:", 0, &v2);
  return v2;
}

uint64_t sub_22905614C(id a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  uint64_t v13;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  v4 = a3;
  v5 = v4;
  if (v4 == a1)
  {
    v13 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(a1, "colorUsingSRGBColorSpace");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorUsingSRGBColorSpace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0.0;
    v20 = 0.0;
    v21 = 0.0;
    v18 = 0.0;
    v19 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    v15 = 0.0;
    objc_msgSend(v6, "getRed:green:blue:alpha:", &v22, &v20, &v21, &v19);
    objc_msgSend(v7, "getRed:green:blue:alpha:", &v18, &v16, &v17, &v15);
    v8 = round(v21 * 255.0);
    v9 = round(v19 * 255.0);
    v10 = round(v17 * 255.0);
    v11 = round(v15 * 255.0);
    v12 = round(v22 * 255.0) == round(v18 * 255.0);
    if (round(v20 * 255.0) != round(v16 * 255.0))
      v12 = 0;
    if (v8 != v10)
      v12 = 0;
    v13 = v9 == v11 && v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

BOOL sub_2290562A8(void *a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  double v10;
  double v11;
  _BOOL8 v12;
  double v14;
  double v15;

  if (!a4)
    return 0;
  v6 = a4;
  objc_msgSend(a1, "colorUsingSRGBColorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorUsingSRGBColorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0.0;
  v15 = 0.0;
  if ((objc_msgSend(v7, "getHue:saturation:brightness:alpha:", &v15, 0, 0, 0) & 1) == 0)
    v15 = 0.0;
  v9 = objc_msgSend(v8, "getHue:saturation:brightness:alpha:", &v14, 0, 0, 0);
  v10 = v14;
  if (!v9)
    v10 = 0.0;
  v11 = vabdd_f64(v10, v15);
  v12 = fabs(v11 + -1.0) <= a2 || v11 <= a2;

  return v12;
}

id sub_229056394(void *a1)
{
  CGColorSpaceRef v2;
  CGColorSpace *v3;
  id v4;
  CGColorSpaceRef ColorSpace;
  id v6;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  CGColor *v11;
  size_t v12;
  char *v13;
  const CGFloat *Components;
  CGColorRef v15;
  CGColorRef v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF278]);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_retainAutorelease(a1);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v4, "CGColor"));
  if (CFEqual(ColorSpace, v3))
  {
    v6 = v4;
  }
  else
  {
    v8 = MEMORY[0x22E2C05EC](v3, 0);
    if (v8)
    {
      v9 = (const void *)v8;
      objc_msgSend(objc_retainAutorelease(v4), "CGColor");
      v10 = CGColorTransformConvertColor();
      if (v10)
      {
        v11 = (CGColor *)v10;
        v12 = 8 * CGColorSpaceGetNumberOfComponents(v3);
        v13 = (char *)v17 - ((v12 + 23) & 0xFFFFFFFFFFFFFFF0);
        Components = CGColorGetComponents(v11);
        memcpy(v13, Components, v12 + 8);
        v15 = CGColorCreate(v3, (const CGFloat *)v13);
        if (v15)
        {
          v16 = v15;
          objc_msgSend(MEMORY[0x24BDF6950], "colorWithCGColor:", v15);
          v6 = (id)objc_claimAutoreleasedReturnValue();
          CFRelease(v16);
        }
        else
        {
          v6 = 0;
        }
        CFRelease(v11);
      }
      else
      {
        v6 = 0;
      }
      CFRelease(v9);
    }
    else
    {
      v6 = 0;
    }
  }
  CFRelease(v3);
  return v6;
}

id sub_229056520(void *a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  const CGFloat *Components;
  id v11;
  const CGFloat *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a1, "colorUsingSRGBColorSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorUsingSRGBColorSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_retainAutorelease(v7);
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v9, "CGColor"));
  v11 = objc_retainAutorelease(v8);
  v12 = CGColorGetComponents((CGColorRef)objc_msgSend(v11, "CGColor"));
  objc_msgSend(MEMORY[0x24BDF6950], "akColorWithSRGBRed:green:blue:alpha:", *v12 * a2 + (1.0 - a2) * *Components, v12[1] * a2 + (1.0 - a2) * Components[1], v12[2] * a2 + (1.0 - a2) * Components[2], v12[3] * a2 + (1.0 - a2) * Components[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_229056600(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "colorUsingSRGBColorSpace");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF638]), "initWithColor:", v9);
  else
    v7 = 0;
  objc_msgSend(v7, "stringRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v8, v6);

}

id sub_22905669C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBF638], "colorWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "akColorWithCIColor:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_229058D50(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

uint64_t sub_229058D84(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_didShow);
}

uint64_t sub_229059084(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hide");
}

void sub_2290592C8(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 0.0);

}

void sub_2290592FC(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

double sub_22906411C(void *a1, uint64_t a2, double *a3)
{
  double result;
  double v5;

  v5 = 0.0;
  objc_msgSend(a1, "scanDouble:", &v5);
  result = v5;
  *a3 = v5;
  return result;
}

double sub_2290643DC(float64x2_t *a1, double a2)
{
  double result;

  __asm { FMOV            V5.2D, #3.0 }
  *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_n_f64(vmulq_f64(a1[1], _Q5), a2), 1.0 - a2), 1.0 - a2), vmulq_n_f64(vmulq_n_f64(*a1, 1.0 - a2), 1.0 - a2), 1.0 - a2), vmulq_n_f64(vmulq_n_f64(vmulq_f64(a1[2], _Q5), a2), a2), 1.0 - a2), vmulq_n_f64(vmulq_n_f64(a1[3], a2), a2), a2);
  return result;
}

void sub_229064434(float64x2_t *a1, uint64_t a2, double a3, double a4)
{
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v8 = 1.0 - a3;
  *(double *)a2 = sub_22906655C(a1, 1.0 - a3, a3, 1.0 - a3, a3, 1.0 - a3, a3);
  *(_QWORD *)(a2 + 8) = v9;
  *(double *)(a2 + 16) = sub_22906655C(a1, v8, a3, v8, a3, 1.0 - a4, a4);
  *(_QWORD *)(a2 + 24) = v10;
  *(double *)(a2 + 32) = sub_22906655C(a1, v8, a3, 1.0 - a4, a4, 1.0 - a4, a4);
  *(_QWORD *)(a2 + 40) = v11;
  *(double *)(a2 + 48) = sub_22906655C(a1, 1.0 - a4, a4, 1.0 - a4, a4, 1.0 - a4, a4);
  *(_QWORD *)(a2 + 56) = v12;
}

uint64_t sub_229064504(double *a1, double *a2, double *a3, double *a4, double *a5)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  BOOL v13;
  double v14;
  BOOL v15;
  BOOL v16;
  double v17;

  v5 = a1[1];
  v6 = a1[2] - *a1;
  v7 = a1[3] - v5;
  v8 = a2[1];
  v9 = a2[2] - *a2;
  v10 = a2[3] - v8;
  v11 = (v7 * (*a2 - *a1) + (v5 - v8) * v6) / (v10 * v6 - v9 * v7);
  *a4 = v11;
  if (v11 >= 0.0)
  {
    v13 = v11 == 1.0;
    v12 = v11 >= 1.0;
  }
  else
  {
    v12 = 1;
    v13 = 0;
  }
  if (!v13 && v12)
    return 0;
  v14 = (v10 * (*a1 - *a2) + (a2[1] - a1[1]) * v9) / (v7 * v9 - v6 * v10);
  *a3 = v14;
  if (v14 >= 0.0)
  {
    v16 = v14 == 1.0;
    v15 = v14 >= 1.0;
  }
  else
  {
    v15 = 1;
    v16 = 0;
  }
  if (!v16 && v15)
    return 0;
  v17 = a1[1];
  *a5 = *a1 + v14 * v6;
  a5[1] = v17 + *a3 * v7;
  return 1;
}

void sub_2290645B0(float64x2_t *a1, double *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  float64_t v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v27;
  BOOL v28;
  BOOL v29;
  uint64_t v30;
  float64x2_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  double v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a2[2];
  v5 = a2[3];
  v7 = v5 - a2[1];
  v8 = v6 - *a2;
  v9 = v8 * v8 + v7 * v7;
  v10 = (float)(1.0 / sqrtf(v9));
  v11 = v7 * v10;
  v12 = -(v8 * v10);
  v13 = v5 * v12 + v11 * v6;
  v14 = a1->f64[1] * v12 + v11 * a1->f64[0] - v13;
  v31.f64[0] = 0.0;
  v31.f64[1] = v14;
  v15 = a1[1].f64[1] * v12 + v11 * a1[1].f64[0] - v13;
  v32 = 0x3FD5555560000000;
  v33 = v15;
  v16 = a1[2].f64[1] * v12 + v11 * a1[2].f64[0] - v13;
  v34 = 0x3FE5555560000000;
  v35 = v16;
  v17 = v12 * a1[3].f64[1] + v11 * a1[3].f64[0] - v13;
  v36 = 0x3FF0000000000000;
  v37 = v17;
  *(float *)&v17 = v15 * 9.0 + v14 * -3.0 + v16 * -9.0 + v17 * 3.0;
  *(float *)&v16 = v15 * -12.0 + v14 * 6.0 + v16 * 6.0;
  *(float *)&v14 = v15 * 3.0 + v14 * -3.0;
  *(float *)&v14 = sqrtf((float)((float)(*(float *)&v17 * -4.0) * *(float *)&v14) + (float)(*(float *)&v16
                                                                                          * *(float *)&v16));
  *(float *)&v17 = *(float *)&v17 + *(float *)&v17;
  v18 = (float)((float)-*(float *)&v16 - *(float *)&v14) / *(float *)&v17;
  v19 = sub_2290643DC(&v31, (float)((float)(*(float *)&v14 - *(float *)&v16) / *(float *)&v17));
  v21 = v20;
  v22 = sub_2290643DC(&v31, v18);
  v23 = fabs(v21);
  v25 = fabs(v24);
  v27 = v22 > 1.0 || v22 < 0.0 || v23 < v25;
  if (v27 && (v19 >= 0.0 ? (v28 = v19 > 1.0) : (v28 = 1), !v28)
    || (v22 >= 0.0 ? (v29 = v22 > 1.0) : (v29 = 1), v19 = v22, !v29))
  {
    *(double *)a3 = sub_2290643DC(a1, v19);
    *(_QWORD *)(a3 + 8) = v30;
  }
}

_QWORD *sub_2290647DC(_QWORD *result)
{
  ++*result;
  return result;
}

uint64_t sub_2290647EC(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  if (*(_QWORD *)result == v2)
  {
    *(_DWORD *)(result + 16) = *(_DWORD *)a2;
    *(_OWORD *)(result + 72) = *(_OWORD *)(*(_QWORD *)(a2 + 8) + 48);
    *(_OWORD *)(result + 56) = *(_OWORD *)(*(_QWORD *)(a2 + 8) + 32);
    *(_OWORD *)(result + 40) = *(_OWORD *)(*(_QWORD *)(a2 + 8) + 16);
    *(_OWORD *)(result + 24) = *(_OWORD *)*(_QWORD *)(a2 + 8);
  }
  *(_QWORD *)(result + 8) = v2 + 1;
  return result;
}

void sub_229064B48(double *a1, double *a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v44;
  double v45;
  double v46;
  double v47;
  AKTSDPathIntersection *v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  double v52;
  AKTSDPathIntersection *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  float64x2_t v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  double v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  v12 = *a1;
  v13 = a1[2];
  v14 = a1[4];
  v15 = a1[5];
  v16 = a1[6];
  v17 = a1[7];
  v19 = a2[2];
  v18 = a2[3];
  v20 = v18 - a2[1];
  v21 = v19 - *a2;
  v22 = v21 * v21 + v20 * v20;
  v23 = (float)(1.0 / sqrtf(v22));
  v24 = v20 * v23;
  v25 = -(v21 * v23);
  v26 = v18 * v25 + v24 * v19;
  v57 = a1[3];
  v58 = a1[1];
  v59.f64[0] = 0.0;
  v59.f64[1] = v58 * v25 + v24 * v12 - v26;
  v60 = 0x3FD5555555555555;
  v61 = v57 * v25 + v24 * v13 - v26;
  v55 = v17;
  v56 = v15;
  v62 = 0x3FE5555555555555;
  v63 = v15 * v25 + v24 * v14 - v26;
  v64 = 0x3FF0000000000000;
  v65 = v17 * v25 + v24 * v16 - v26;
  v27 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  sub_2290694C0(&v59, (uint64_t)&v59, v27, 1.0);
  v28 = objc_msgSend(v27, "count");
  if (v28 >= 1)
  {
    v29 = v28;
    v30 = 0;
    v54 = v14;
    do
    {
      objc_msgSend(v27, "objectAtIndex:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      v35 = v33 * (v33 * (v16 * v33 + (1.0 - v33) * v14) + (1.0 - v33) * (v14 * v33 + (1.0 - v33) * v13))
          + (1.0 - v33) * (v33 * (v14 * v33 + (1.0 - v33) * v13) + (1.0 - v33) * (v13 * v33 + (1.0 - v33) * v12));
      v36 = a2[2] - *a2;
      v37 = v35 - *a2;
      if (v36 * v37 > -0.001)
      {
        v34 = 1.0 - v33;
        v38 = v33 * (v33 * (v55 * v33 + v34 * v56) + v34 * (v56 * v33 + v34 * v57))
            + v34 * (v33 * (v56 * v33 + v34 * v57) + v34 * (v57 * v33 + v34 * v58));
        v39 = a2[1];
        v40 = a2[3] - v39;
        v41 = v40 * v40 + v36 * v36;
        v42 = (v38 - v39) * (v38 - v39) + v37 * v37;
        if (v40 * (v38 - v39) > -0.001 && v42 <= v41)
        {
          if (!v11)
            break;
          v44 = v13;
          v45 = v16;
          v46 = v12;
          v47 = sqrt(v42) / sqrt(v41);
          v48 = [AKTSDPathIntersection alloc];
          if (a5)
          {
            v49 = a4;
            v50 = v47;
            v51 = a3;
            v52 = v33;
          }
          else
          {
            v49 = a3;
            v50 = v33;
            v51 = a4;
            v52 = v47;
          }
          v53 = -[AKTSDPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](v48, "initWithSegment:atT:onSegmentB:atT:atPoint:", v49, v51, v50, v52, v35, v38);
          objc_msgSend(v11, "addObject:", v53);

          v12 = v46;
          v16 = v45;
          v13 = v44;
          v14 = v54;
        }
      }
      ++v30;
    }
    while (v29 != v30);
  }

}

void sub_229064E64(double *a1, double *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v8;
  AKTSDPathIntersection *v9;
  AKTSDPathIntersection *v10;
  __int128 v11;
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  v11 = *MEMORY[0x24BDBEFB0];
  if (sub_229064504(a1, a2, &v13, &v12, (double *)&v11))
  {
    v8 = a5;
    v9 = [AKTSDPathIntersection alloc];
    v10 = -[AKTSDPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](v9, "initWithSegment:atT:onSegmentB:atT:atPoint:", a3, a4, v13, v12, v11);
    objc_msgSend(v8, "addObject:", v10);

  }
}

double sub_22906655C(float64x2_t *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  double result;

  v7 = a1[1];
  v8 = a1[2];
  v9 = vmlaq_n_f64(vmulq_n_f64(v8, a7), v7, a6);
  *(_QWORD *)&result = *(_OWORD *)&vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(a1[3], a7), v8, a6), a5), v9, a4), a3), vmlaq_n_f64(vmulq_n_f64(v9, a5), vmlaq_n_f64(vmulq_n_f64(v7, a7), *a1, a6), a4), a2);
  return result;
}

void sub_2290665A0(float64x2_t *a1, void *a2, uint64_t a3, uint64_t a4, void *a5, void *a6, int a7, uint64_t a8)
{
  id v15;
  id v16;
  id v17;
  float64_t v18;
  float64_t v19;
  double v20;
  float v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  float v31;
  float v32;
  float v33;
  double v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  float v48;
  float v49;
  float v50;
  float v51;
  float64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  float64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  float v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  float v85;
  uint64_t v86;
  double v87;
  double v88;
  double v89;
  float v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  uint64_t v100;
  float v101;
  _BYTE v102[64];
  _BYTE v103[64];
  float64x2_t v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  uint64_t v111;

  v111 = *MEMORY[0x24BDAC8D0];
  v15 = a2;
  v16 = a5;
  v17 = a6;
  v101 = 0.0;
  v100 = 0;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, a1->f64[0], a1->f64[1]);
  v98 = v18;
  v99 = v19;
  v104.f64[0] = v18;
  v104.f64[1] = v19;
  objc_msgSend(v15, "curvatureAt:fromElement:", v100, v101);
  v21 = v20;
  *(float *)&v20 = v101;
  objc_msgSend(v15, "myGradientAt:fromElement:", v100, v20);
  v94 = v22;
  v92 = v23;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, a1[3].f64[0], a1[3].f64[1]);
  v25 = v24;
  v97 = v26;
  v109 = v26;
  v110 = v24;
  objc_msgSend(v15, "curvatureAt:fromElement:", v100, v101);
  v28 = v27;
  *(float *)&v27 = v101;
  objc_msgSend(v15, "myGradientAt:fromElement:", v100, v27);
  v93 = v29;
  v91 = v30;
  v31 = 0.5;
  if (v21 <= 0.5)
    v32 = v21;
  else
    v32 = 0.5;
  if (v32 >= -0.5)
    v33 = v32;
  else
    v33 = -0.5;
  if (v28 <= 0.5)
    v31 = v28;
  if (v31 < -0.5)
    v31 = -0.5;
  v90 = v31;
  objc_msgSend(v15, "lineWidth");
  v35 = v34;
  v36 = a1->f64[1];
  v96 = v25;
  if (v16)
  {
    objc_msgSend(v16, "pressureAt:", a1->f64[0]);
    v38 = v35;
    v39 = v36 * v37 * v38;
    v40 = a1[1].f64[1];
    objc_msgSend(v16, "pressureAt:", a1[1].f64[0]);
    v42 = v40 * v41 * v38;
    v43 = a1[2].f64[1];
    objc_msgSend(v16, "pressureAt:", a1[2].f64[0]);
    v45 = v43 * v44 * v38;
    v46 = a1[3].f64[1];
    objc_msgSend(v16, "pressureAt:", a1[3].f64[0]);
  }
  else
  {
    v38 = v35;
    v39 = v36 * v38;
    v42 = a1[1].f64[1] * v38;
    v45 = a1[2].f64[1] * v38;
    v46 = a1[3].f64[1];
    v47 = 1.0;
  }
  v48 = v42;
  v49 = v39;
  v50 = v45;
  v51 = v38 * (v46 * v47);
  v52 = a1[1].f64[0] - a1->f64[0];
  v53 = (float)(v48 - v49);
  v54 = sub_22902DEFC(v94, v92, 1.0 - (float)(v33 * v49));
  v55 = sub_22902DF3C(-v92, v94);
  v56 = sub_22902DEE4(v98, v99, v55 * v53 + v52 * v54);
  v105 = v56;
  v106 = v57;
  v95 = v57;
  v58 = a1[2].f64[0] - a1[3].f64[0];
  v59 = sub_22902DEFC(v93, v91, 1.0 - (float)(v90 * v51));
  v60 = sub_22902DF3C(-v91, v93);
  v61 = sub_22902DEE4(v97, v96, v60 * (float)(v50 - v51) + v58 * v59);
  v63 = v62;
  v107 = v61;
  v108 = v62;
  if (a7)
  {
    if (a7 > 19)
      goto LABEL_19;
    v64 = sub_22902DEF0(v97, v96, v98);
    if (sub_22902DF18(v64, v65) <= 0.5)
      goto LABEL_19;
  }
  v66 = sub_2290643DC(&v104, 0.33);
  v68 = v67;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, sub_2290643DC(a1, 0.33));
  v70 = sub_22902DEF0(v66, v68, v69);
  *(float *)&v68 = sub_22902DF18(v70, v71) + 0.0;
  v72 = sub_2290643DC(&v104, 0.5);
  v74 = v73;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, sub_2290643DC(a1, 0.5));
  v76 = sub_22902DEF0(v72, v74, v75);
  v78 = sub_22902DF18(v76, v77) + *(float *)&v68;
  v79 = sub_2290643DC(&v104, 0.66);
  v81 = v80;
  objc_msgSend(v15, "transformedTotalCoordinate:betweenElement:andElement:withPressure:getElement:getPercentage:", a3, a4, v16, &v100, &v101, sub_2290643DC(a1, 0.66));
  v83 = sub_22902DEF0(v79, v81, v82);
  v85 = sub_22902DF18(v83, v84) + v78;
  if (v85 <= 0.2)
  {
LABEL_19:
    if ((_DWORD)a8)
    {
      objc_msgSend(v17, "moveToPoint:", v98, v99);
    }
    else
    {
      objc_msgSend(v17, "currentPoint");
      v88 = sub_22902DEF0(v98, v99, v87);
      if (sub_22902DF18(v88, v89) > 1.0)
        objc_msgSend(v17, "lineToPoint:", v98, v99);
    }
    objc_msgSend(v17, "curveToPoint:controlPoint1:controlPoint2:", v97, v96, v56, v95, v61, v63);
  }
  else
  {
    sub_229064434(a1, (uint64_t)v103, 0.0, 0.5);
    sub_229064434(a1, (uint64_t)v102, 0.5, 1.0);
    v86 = (a7 + 1);
    sub_2290665A0(v103, v15, a3, a4, v16, v17, v86, a8);
    sub_2290665A0(v102, v15, a3, a4, v16, v17, v86, 0);
  }

}

void sub_229066B34(float64x2_t *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  float v23;
  float v24;
  uint64_t v25;
  void *v26;
  double v27;
  float v28;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  float v40;
  void *v41;
  float64x2_t v42;
  float64x2_t v43;
  double v44;
  float64x2_t v45;
  double v46;
  float64x2_t v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t v50;
  float64x2_t v51;
  double v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  uint64_t v69;
  float v70;
  uint64_t v71;
  float v72;
  uint64_t v73;
  double v74;
  double v75;
  float v76;
  float v77;
  uint64_t v78;
  float64x2_t v79;
  float64x2_t v80;
  float64x2_t v81;
  float64x2_t v82;
  double *v83;
  float64x2_t v84;
  float64x2_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  uint64_t v101;
  float64x2_t v102;
  float v103;
  uint64_t v104;
  float v105;
  uint64_t v106;
  double v107;
  float v108;
  float v109;
  uint64_t v110;
  float64x2_t v111;
  float64x2_t v112;
  float64x2_t v113;
  double v114;
  float64x2_t v115;
  double *f64;
  float64x2_t v119;
  float64x2_t v120;
  AKTSDPathIntersection *v121;
  uint64_t v122;
  float64x2_t v123;
  int8x16_t v124;
  float64x2_t v125;
  uint64_t v126;
  void *v127;
  void *v128;
  uint64_t v129;
  float64x2_t v130;
  id v131;
  float64x2_t v132;
  float64x2_t v133;
  float64x2_t v134;
  float64x2_t v135;
  uint64_t v136;
  float64x2x2_t v137;
  float64x2x2_t v138;

  v136 = *MEMORY[0x24BDAC8D0];
  v131 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_msgSend(v13, "count");
  v15 = v14 - 1;
  v127 = v12;
  if ((unint64_t)(v14 - 1) < 2)
  {
    v17 = 0;
    v18 = 0;
    goto LABEL_23;
  }
  v16 = v14;
  v129 = v14 - 1;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = a1[1].f64[0];
  v21 = a1[2].f64[0];
  v22 = a1[3].f64[0];
  v23 = fmin(a1->f64[0], fmin(v20, fmin(v21, v22)));
  v24 = fmax(a1->f64[0], fmax(v20, fmax(v21, v22)));
  v25 = 2;
  do
  {
    objc_msgSend(v13, "objectAtIndex:", v25 - 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "t");
    v28 = v27;
    if (v28 > v23 && v28 < v24)
    {
      if (!v17)
        v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v30 = v28;
      v132.f64[0] = v30;
      v132.f64[1] = -100.0;
      v133.f64[0] = v30;
      v133.f64[1] = 100.0;
      sub_229064B48(a1->f64, v132.f64, v25 - 1, v25 - 1, 0, v17);
    }
    else
    {
      v30 = v28;
    }
    v31 = a1[3].f64[0];
    if (v31 > v30)
      v18 = v25 - 1;
    if (v31 < v30)
      v32 = v25 - 1;
    else
      v32 = 0;
    if (!v19)
      v19 = v32;

    ++v25;
  }
  while (v16 != v25);
  v12 = v127;
  v15 = v129;
  if (!v19)
  {
LABEL_23:
    v19 = v15;
    if (!v17)
      goto LABEL_37;
    goto LABEL_24;
  }
  if (!v17)
  {
LABEL_37:
    objc_msgSend(v13, "objectAtIndex:", v18);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndex:", v19);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "t");
    v92 = v91;
    objc_msgSend(v90, "t");
    v94 = v93;
    objc_msgSend(v89, "skew");
    v96 = v95;
    objc_msgSend(v90, "skew");
    v98 = v97;
    objc_msgSend(v131, "lineWidth");
    v100 = v99;
    objc_msgSend(v131, "length");
    v101 = 0;
    v102 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    v103 = v96;
    *(double *)&v104 = (float)-v103;
    v105 = v98;
    *(double *)&v106 = (float)(v103 + v105);
    v108 = v100 / v107;
    *(float *)&v107 = v94;
    v109 = v92;
    *(double *)&v110 = (float)(*(float *)&v107 - v109);
    v111 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v109), 0);
    v112 = (float64x2_t)vdupq_lane_s64(v110, 0);
    v113 = (float64x2_t)vdupq_lane_s64(v106, 0);
    v114 = v108;
    v115 = (float64x2_t)vdupq_lane_s64(v104, 0);
    __asm
    {
      FMOV            V6.2D, #0.5
      FMOV            V7.2D, #1.0
    }
    do
    {
      f64 = a1[v101].f64;
      v138 = vld2q_f64(f64);
      v119 = vdivq_f64(vsubq_f64(v138.val[0], v111), v112);
      v120 = vabsq_f64(v119);
      v138.val[0] = vmlaq_f64(v138.val[0], v138.val[1], vmulq_n_f64(vmlaq_f64(v115, v113, vmaxnmq_f64(vminnmq_f64((float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcgtq_f64(v102, v120), (int8x16_t)vcgtq_f64(v120, v102)), (int8x16_t)v119, _Q6), _Q7), (float64x2_t)0)), v114));
      *f64 = v138.val[0].f64[0];
      a1[v101 + 1].f64[0] = v138.val[0].f64[1];
      v101 += 2;
    }
    while (v101 != 4);
    sub_2290665A0(a1, v131, objc_msgSend(v89, "segment") + 1, objc_msgSend(v90, "segment"), v11, v12, 0, a5);

    goto LABEL_40;
  }
LABEL_24:
  if (!objc_msgSend(v17, "count"))
    goto LABEL_37;
  v128 = v11;
  objc_msgSend(v17, "sortUsingSelector:", sel_compareT_);
  v121 = -[AKTSDPathIntersection initWithSegment:atT:atPoint:]([AKTSDPathIntersection alloc], "initWithSegment:atT:atPoint:", v18, 1.0, 1000.0, 0.0);
  objc_msgSend(v17, "addObject:");
  v126 = objc_msgSend(v17, "count");
  if (v126)
  {
    v33 = 0;
    v122 = v126 - 1;
    v34 = 0.0;
    __asm { FMOV            V0.2D, #0.5 }
    v124 = _Q0;
    v125 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    __asm { FMOV            V0.2D, #1.0 }
    v123 = _Q0;
    do
    {
      v40 = v34;
      objc_msgSend(v17, "objectAtIndex:", v33);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "t");
      v42 = a1[1];
      v132 = *a1;
      v133 = v42;
      v43 = a1[3];
      v134 = a1[2];
      v135 = v43;
      v34 = v44;
      v43.f64[0] = 1.0 - v40;
      v45 = vmlaq_n_f64(vmulq_n_f64(v134, v40), v133, v43.f64[0]);
      v130 = vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(v135, v40), v134, v43.f64[0]), v40), v45, v43.f64[0]), v40), vmlaq_n_f64(vmulq_n_f64(v45, v40), vmlaq_n_f64(vmulq_n_f64(v133, v40), v132, v43.f64[0]), v43.f64[0]), v43.f64[0]);
      v46 = 1.0 - v34;
      v47 = vmlaq_n_f64(vmulq_n_f64(v133, v34), v132, v46);
      v48 = vmlaq_n_f64(vmulq_n_f64(v134, v34), v133, v46);
      v49 = vmlaq_n_f64(vmulq_n_f64(v135, v34), v134, v46);
      v132 = v130;
      v133 = vmlaq_n_f64(vmulq_n_f64(vmlaq_n_f64(vmulq_n_f64(v49, v40), v48, v43.f64[0]), v40), vmlaq_n_f64(vmulq_n_f64(v48, v40), v47, v43.f64[0]), v43.f64[0]);
      v50 = vmlaq_n_f64(vmulq_n_f64(v48, v34), v47, v46);
      v51 = vmlaq_n_f64(vmulq_n_f64(v49, v34), v48, v46);
      v134 = vmlaq_n_f64(vmulq_n_f64(v51, v40), v50, v43.f64[0]);
      v135 = vmlaq_n_f64(vmulq_n_f64(v51, v34), v50, v46);
      objc_msgSend(v41, "point");
      v53 = v52;
      v54 = objc_msgSend(v41, "segment");
      v55 = objc_msgSend(v41, "segment");
      if (v130.f64[0] <= v53)
      {
        if (v33 == v122)
          v56 = v55 + 1;
        else
          v56 = v55;
        v54 -= v33 != v122;
      }
      else
      {
        v56 = v55 + 1;
      }
      objc_msgSend(v13, "objectAtIndex:", v54, v130.f64[0]);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v56);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "t");
      v60 = v59;
      objc_msgSend(v58, "t");
      v62 = v61;
      objc_msgSend(v57, "skew");
      v64 = v63;
      objc_msgSend(v58, "skew");
      v66 = v65;
      objc_msgSend(v131, "lineWidth");
      v68 = v67;
      objc_msgSend(v131, "length");
      v69 = 0;
      v70 = v64;
      *(double *)&v71 = (float)-v70;
      v72 = v66;
      *(double *)&v73 = (float)(v70 + v72);
      *(float *)&v74 = v68 / v74;
      v75 = *(float *)&v74;
      v76 = v62;
      v77 = v60;
      *(double *)&v78 = (float)(v76 - v77);
      v79 = (float64x2_t)vdupq_lane_s64(COERCE__INT64(v77), 0);
      v80 = (float64x2_t)vdupq_lane_s64(v78, 0);
      v81 = (float64x2_t)vdupq_lane_s64(v73, 0);
      v82 = (float64x2_t)vdupq_lane_s64(v71, 0);
      do
      {
        v83 = &v132.f64[v69];
        v137 = vld2q_f64(v83);
        v84 = vdivq_f64(vsubq_f64(v137.val[0], v79), v80);
        v85 = vabsq_f64(v84);
        v137.val[0] = vmlaq_f64(v137.val[0], v137.val[1], vmulq_n_f64(vmlaq_f64(v82, v81, vmaxnmq_f64(vminnmq_f64((float64x2_t)vbslq_s8(vorrq_s8((int8x16_t)vcgtq_f64(v125, v85), (int8x16_t)vcgtq_f64(v85, v125)), (int8x16_t)v84, v124), v123), (float64x2_t)0)), v75));
        *v83 = v137.val[0].f64[0];
        *(float64_t *)((char *)&v132 + v69 * 8 + 16) = v137.val[0].f64[1];
        v69 += 4;
      }
      while (v69 != 8);
      v86 = objc_msgSend(v57, "segment") + 1;
      v87 = objc_msgSend(v58, "segment");
      v88 = v86;
      v12 = v127;
      sub_2290665A0(&v132, v131, v88, v87, v128, v127, 0, a5 & 1);

      LOBYTE(a5) = 0;
      ++v33;
    }
    while (v33 != v126);
  }

  v11 = v128;
LABEL_40:

}

CGPath *sub_229067FA8(int a1, int a2, double a3, double a4, double a5, double a6, long double a7, double a8, double a9)
{
  double v15;
  double v16;
  long double v17;
  __double2 v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  long double v39;
  long double v40;
  CGPath *Mutable;
  __int128 v42;
  double v46;
  CGAffineTransform v48;
  CGAffineTransform v49;
  CGAffineTransform m;

  v15 = (a3 - a8) * 0.5;
  v16 = (a4 - a9) * 0.5;
  v17 = fmod(a7, 360.0);
  v18 = __sincos_stret(v17 * 3.14159265 / 180.0);
  v19 = v18.__sinval * v16 + v18.__cosval * v15;
  v20 = v18.__cosval * v16 - v18.__sinval * v15;
  v21 = fabs(a5);
  v22 = fabs(a6);
  v23 = a5 * a5;
  v24 = a6 * a6;
  v25 = v19 * v19 / (a5 * a5) + v20 * v20 / (a6 * a6);
  if (v25 > 1.0)
  {
    v26 = sqrt(v25);
    v21 = v21 * v26;
    v22 = v22 * v26;
    v23 = v21 * v21;
    v24 = v22 * v22;
  }
  v27 = (v23 * v24 - v23 * (v20 * v20) - v24 * (v19 * v19)) / (v19 * v19 * v24 + v23 * (v20 * v20));
  if (v27 < 0.0)
    v27 = 0.0;
  v28 = sqrt(v27);
  if (a1 == a2)
    v28 = -v28;
  v29 = v20 * v21 / v22 * v28;
  v30 = -(v22 * v19) / v21 * v28;
  v31 = (a4 + a9) * 0.5;
  v46 = (a3 + a8) * 0.5 + v30 * -v18.__sinval + v18.__cosval * v29;
  v32 = v31 + v18.__cosval * v30 + v18.__sinval * v29;
  v33 = (v20 - v30) / v22;
  v34 = (-v19 - v29) / v21;
  v35 = (-v20 - v30) / v22;
  v36 = acos((v19 - v29) / v21 / sqrt(v33 * v33 + (v19 - v29) / v21 * ((v19 - v29) / v21)));
  if (v33 < 0.0)
    v36 = -v36;
  v37 = v36 * 180.0 / 3.14159265;
  v38 = acos(v34 / sqrt(v35 * v35 + v34 * v34));
  if (v35 < 0.0)
    v38 = -v38;
  v39 = fmod(v38 * 180.0 / 3.14159265, 360.0);
  v40 = fmod(v37, 360.0);
  Mutable = CGPathCreateMutable();
  v42 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&m.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&m.c = v42;
  *(_OWORD *)&m.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  *(_OWORD *)&v49.a = *(_OWORD *)&m.a;
  *(_OWORD *)&v49.c = v42;
  *(_OWORD *)&v49.tx = *(_OWORD *)&m.tx;
  CGAffineTransformTranslate(&m, &v49, v46, v32);
  v48 = m;
  CGAffineTransformRotate(&v49, &v48, a7 * 180.0 / 3.14159265);
  m = v49;
  v48 = v49;
  CGAffineTransformScale(&v49, &v48, 1.0, v22 / v21);
  m = v49;
  v48 = v49;
  CGAffineTransformTranslate(&v49, &v48, -v46, -v32);
  m = v49;
  CGPathMoveToPoint(Mutable, &m, 0.0, 0.0);
  CGPathAddArc(Mutable, &m, v46, v32, v21, v40, v39, a2 != 1);
  return Mutable;
}

CGPath *sub_2290682D0(const CGPath *a1, const CGPath *a2, uint64_t a3, uint64_t a4)
{
  CGPath *MutableCopy;
  uint64_t info;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  MutableCopy = CGPathCreateMutableCopy(a1);
  if (a3 < a4)
  {
    do
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v10 = 0u;
      info = a3;
      CGPathApply(a2, &info, (CGPathApplierFunction)sub_2290647EC);
      if (DWORD2(v10) == 3)
      {
        CGPathAddCurveToPoint(MutableCopy, 0, *(CGFloat *)&v11, *((CGFloat *)&v11 + 1), *(CGFloat *)&v12, *((CGFloat *)&v12 + 1), *(CGFloat *)&v13, *((CGFloat *)&v13 + 1));
      }
      else if (DWORD2(v10))
      {
        if (DWORD2(v10) == 1)
        {
          CGPathAddLineToPoint(MutableCopy, 0, *(CGFloat *)&v11, *(CGFloat *)&v11);
        }
        else if (DWORD2(v10) == 4)
        {
          CGPathCloseSubpath(MutableCopy);
        }
      }
      else
      {
        CGPathMoveToPoint(MutableCopy, 0, *(CGFloat *)&v11, *((CGFloat *)&v11 + 1));
      }
      ++a3;
    }
    while (a4 != a3);
  }
  return MutableCopy;
}

const CGPath *sub_2290683C8(void *a1)
{
  id v1;
  const CGPath *Mutable;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  unsigned __int16 v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  unsigned __int16 v17;
  CGPoint v18;
  CGPath *v19;
  CGPath *v20;
  const CGPath *v21;
  CGPoint CurrentPoint;
  CGPath *v23;
  CGPath *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double y;
  double v32;
  CGPoint v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGPoint v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGPath *v48;
  CGFloat v49;
  double v50;
  CGPoint v51;
  double v52;
  double v53;
  CGPoint v54;
  CGPoint v55;
  CGPoint v56;
  CGPoint v57;
  double v58;
  double v59;
  CGPoint v60;
  CGPoint v61;
  __int16 v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGPoint v67;
  double x;
  double v69;
  CGPoint v70;
  CGPoint v71;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double info;
  double v79;
  double v80;
  double v81;
  uint64_t v82;
  uint64_t v83;
  long double v84;
  id v85;
  double v86;
  double v87;
  uint64_t v88;
  int v89;
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  Mutable = CGPathCreateMutable();
  v86 = 0.0;
  v87 = 0.0;
  v4 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v73 = v1;
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = *(_QWORD *)asc_229092F88;
  v89 = 2883717;
  v6 = (void *)MEMORY[0x24BDD14A8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v88, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "characterSetWithCharactersInString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCharactersToBeSkipped:", v8);

  v9 = 0;
  v10 = 0;
  v11 = v3;
  v12 = v4;
  while (1)
  {
    v13 = v9;
    objc_msgSend(MEMORY[0x24BDD14A8], "letterCharacterSet");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v9;
    v15 = objc_msgSend(v5, "scanCharactersFromSet:intoString:", v14, &v85);
    v9 = v85;

    if (!v15)
      break;
    v16 = objc_msgSend(v9, "characterAtIndex:", 0);
    v17 = v16;
    if (v16 > 96)
    {
      switch(v16)
      {
        case 'a':
          CurrentPoint = CGPathGetCurrentPoint(Mutable);
          v76 = 0.0;
          v74 = 0.0;
          v83 = 0;
          v84 = 0.0;
          v81 = 0.0;
          v82 = 0;
          v80 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &v76);
          objc_msgSend(v5, "scanCGFloat:", &v74);
          objc_msgSend(v5, "scanCGFloat:", &v84);
          objc_msgSend(v5, "scanInteger:", &v83);
          objc_msgSend(v5, "scanInteger:", &v82);
          objc_msgSend(v5, "scanCGFloat:", &v81);
          objc_msgSend(v5, "scanCGFloat:", &v80);
          v80 = CurrentPoint.y + v80;
          v81 = CurrentPoint.x + v81;
          v23 = sub_229067FA8(v83 != 0, v82 != 0, CurrentPoint.x, CurrentPoint.y, v76, v74, v84, v81, v80);
          info = 0.0;
          CGPathApply(v23, &info, (CGPathApplierFunction)sub_2290647DC);
          v24 = sub_2290682D0(Mutable, v23, 1, *(uint64_t *)&info);
          CGPathRelease(v23);
          CGPathRelease(Mutable);
          Mutable = CGPathCreateMutableCopy(v24);
          v21 = v24;
LABEL_8:
          CGPathRelease(v21);
          break;
        case 'b':
        case 'd':
        case 'e':
        case 'f':
        case 'g':
        case 'i':
        case 'j':
        case 'k':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
        case 'u':
          goto LABEL_10;
        case 'c':
          v54 = CGPathGetCurrentPoint(Mutable);
          info = 0.0;
          v79 = 0.0;
          v76 = 0.0;
          v77 = 0.0;
          v74 = 0.0;
          v75 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &info);
          objc_msgSend(v5, "scanCGFloat:", &v79);
          objc_msgSend(v5, "scanCGFloat:", &v76);
          objc_msgSend(v5, "scanCGFloat:", &v77);
          objc_msgSend(v5, "scanCGFloat:", &v74);
          objc_msgSend(v5, "scanCGFloat:", &v75);
          v25 = v54.x + info;
          v27 = v54.x + v76;
          v29 = v54.x + v74;
          v26 = v54.y + v79;
          info = v54.x + info;
          v79 = v54.y + v79;
          v28 = v54.y + v77;
          v76 = v54.x + v76;
          v77 = v54.y + v77;
          v30 = v54.y + v75;
          v74 = v54.x + v74;
          v75 = v54.y + v75;
LABEL_31:
          CGPathAddCurveToPoint(Mutable, 0, v25, v26, v27, v28, v29, v30);
          v12 = v76;
          v11 = v77;
          break;
        case 'h':
          objc_msgSend(v5, "scanCGFloat:", &v86);
          v55 = CGPathGetCurrentPoint(Mutable);
          y = v55.y;
          v32 = v86 - v55.x;
          goto LABEL_52;
        case 'l':
          v10 = v16;
          if (!objc_msgSend(v5, "scanCGFloat:", &v86))
            continue;
          do
          {
            objc_msgSend(v5, "scanCGFloat:", &v87);
            v56 = CGPathGetCurrentPoint(Mutable);
            CGPathAddLineToPoint(Mutable, 0, v86 - v56.x, v87 - v56.y);
          }
          while ((objc_msgSend(v5, "scanCGFloat:", &v86) & 1) != 0);
          break;
        case 'm':
          v57 = CGPathGetCurrentPoint(Mutable);
          objc_msgSend(v5, "scanCGFloat:", &v86);
          objc_msgSend(v5, "scanCGFloat:", &v87);
          info = 0.0;
          CGPathApply(Mutable, &info, (CGPathApplierFunction)sub_2290647DC);
          if (*(uint64_t *)&info < 1)
          {
            v58 = v86;
            v59 = v87;
          }
          else
          {
            v58 = v86 - v57.x;
            v59 = v87 - v57.y;
          }
          CGPathMoveToPoint(Mutable, 0, v58, v59);
          v10 = v17;
          if (!objc_msgSend(v5, "scanCGFloat:", &v86))
            continue;
          do
          {
            objc_msgSend(v5, "scanCGFloat:", &v87);
            v71 = CGPathGetCurrentPoint(Mutable);
            CGPathAddLineToPoint(Mutable, 0, v86 - v71.x, v87 - v71.y);
          }
          while ((objc_msgSend(v5, "scanCGFloat:", &v86) & 1) != 0);
          break;
        case 'q':
          v60 = CGPathGetCurrentPoint(Mutable);
          info = 0.0;
          v79 = 0.0;
          v76 = 0.0;
          v77 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &info);
          objc_msgSend(v5, "scanCGFloat:", &v79);
          objc_msgSend(v5, "scanCGFloat:", &v76);
          objc_msgSend(v5, "scanCGFloat:", &v77);
          v34 = v60.x + info;
          v35 = v60.y + v79;
          info = v34;
          v79 = v35;
          v39 = v60.x + v76;
          v40 = v60.y + v77;
          v76 = v60.x + v76;
          v77 = v60.y + v77;
          v36 = 3.0;
          v37 = v60.x + (v34 - v60.x + v34 - v60.x) / 3.0;
          v38 = v60.y + (v35 - v60.y + v35 - v60.y) / 3.0;
LABEL_39:
          CGPathAddCurveToPoint(Mutable, 0, v37, v38, v34 + (v39 - v34) / v36, v35 + (v40 - v35) / v36, v39, v40);
          v4 = info;
          v3 = v79;
          break;
        case 's':
          v61 = CGPathGetCurrentPoint(Mutable);
          v62 = (unsigned __int16)(v10 - 67) >> 4;
          v63 = v61.x - v12;
          if (v62 & 0xFFFC | (unsigned __int16)((v10 - 67) << 12))
            v63 = -0.0;
          v64 = v61.x + v63;
          if (v62 & 0xFFFC | (unsigned __int16)((v10 - 67) << 12))
            v65 = -0.0;
          else
            v65 = v61.y - v11;
          info = 0.0;
          v79 = 0.0;
          v66 = v61.y + v65;
          v76 = 0.0;
          v77 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &info);
          objc_msgSend(v5, "scanCGFloat:", &v79);
          objc_msgSend(v5, "scanCGFloat:", &v76);
          objc_msgSend(v5, "scanCGFloat:", &v77);
          v44 = v61.x + info;
          v45 = v61.y + v79;
          info = v61.x + info;
          v79 = v61.y + v79;
          v46 = v61.x + v76;
          v47 = v61.y + v77;
          v76 = v61.x + v76;
          v77 = v61.y + v77;
          v48 = Mutable;
          v49 = v64;
          v50 = v66;
LABEL_46:
          CGPathAddCurveToPoint(v48, 0, v49, v50, v44, v45, v46, v47);
          v12 = info;
          v11 = v79;
          break;
        case 't':
          v67 = CGPathGetCurrentPoint(Mutable);
          if (v10 - 81 > 0x23)
          {
            x = v67.x;
            v69 = v67.y;
          }
          else
          {
            x = v67.x;
            v69 = v67.y;
            if (((1 << (v10 - 81)) & 0x900000009) != 0)
            {
              x = v67.x + v67.x - v4;
              v69 = v67.y + v67.y - v3;
            }
          }
          info = 0.0;
          v79 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &info);
          objc_msgSend(v5, "scanCGFloat:", &v79);
          info = v67.x + info;
          v79 = v67.y + v79;
          CGPathAddCurveToPoint(Mutable, 0, x, v67.y + (v69 - v67.y + v69 - v67.y) / 3.0, x + (info - x) / 3.0, v69 + (v79 - v69) / 3.0, info, v79);
          v3 = v69;
          v4 = x;
          break;
        case 'v':
          objc_msgSend(v5, "scanCGFloat:", &v87);
          v70 = CGPathGetCurrentPoint(Mutable);
          v32 = v70.x;
          y = v87 - v70.y;
LABEL_52:
          CGPathAddLineToPoint(Mutable, 0, v32, y);
          break;
        default:
          if (v16 == 122)
LABEL_12:
            CGPathCloseSubpath(Mutable);
          else
LABEL_10:
            NSLog(CFSTR("Cannot process path of type '%@'"), v9);
          break;
      }
    }
    else
    {
      switch(v16)
      {
        case 'A':
          v18 = CGPathGetCurrentPoint(Mutable);
          v76 = 0.0;
          v74 = 0.0;
          v83 = 0;
          v84 = 0.0;
          v81 = 0.0;
          v82 = 0;
          v80 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &v76);
          objc_msgSend(v5, "scanCGFloat:", &v74);
          objc_msgSend(v5, "scanCGFloat:", &v84);
          objc_msgSend(v5, "scanInteger:", &v83);
          objc_msgSend(v5, "scanInteger:", &v82);
          objc_msgSend(v5, "scanCGFloat:", &v81);
          objc_msgSend(v5, "scanCGFloat:", &v80);
          v19 = sub_229067FA8(v83 != 0, v82 != 0, v18.x, v18.y, v76, v74, v84, v81, v80);
          info = 0.0;
          CGPathApply(v19, &info, (CGPathApplierFunction)sub_2290647DC);
          v20 = sub_2290682D0(Mutable, v19, 2, *(uint64_t *)&info);
          CGPathRelease(v19);
          CGPathRelease(Mutable);
          Mutable = CGPathCreateMutableCopy(v20);
          v21 = v20;
          goto LABEL_8;
        case 'B':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'P':
        case 'R':
        case 'U':
          goto LABEL_10;
        case 'C':
          info = 0.0;
          v79 = 0.0;
          v76 = 0.0;
          v77 = 0.0;
          v74 = 0.0;
          v75 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &info);
          objc_msgSend(v5, "scanCGFloat:", &v79);
          objc_msgSend(v5, "scanCGFloat:", &v76);
          objc_msgSend(v5, "scanCGFloat:", &v77);
          objc_msgSend(v5, "scanCGFloat:", &v74);
          objc_msgSend(v5, "scanCGFloat:", &v75);
          v25 = info;
          v26 = v79;
          v27 = v76;
          v28 = v77;
          v29 = v74;
          v30 = v75;
          goto LABEL_31;
        case 'H':
          objc_msgSend(v5, "scanCGFloat:", &v86);
          y = CGPathGetCurrentPoint(Mutable).y;
          v32 = v86;
          goto LABEL_52;
        case 'L':
          v10 = v16;
          if (!objc_msgSend(v5, "scanCGFloat:", &v86))
            continue;
          do
          {
            objc_msgSend(v5, "scanCGFloat:", &v87);
            CGPathAddLineToPoint(Mutable, 0, v86, v87);
          }
          while ((objc_msgSend(v5, "scanCGFloat:", &v86) & 1) != 0);
          break;
        case 'M':
          objc_msgSend(v5, "scanCGFloat:", &v86);
          objc_msgSend(v5, "scanCGFloat:", &v87);
          CGPathMoveToPoint(Mutable, 0, v86, v87);
          v10 = v17;
          if (!objc_msgSend(v5, "scanCGFloat:", &v86))
            continue;
          do
          {
            objc_msgSend(v5, "scanCGFloat:", &v87);
            CGPathAddLineToPoint(Mutable, 0, v86, v87);
          }
          while ((objc_msgSend(v5, "scanCGFloat:", &v86) & 1) != 0);
          break;
        case 'Q':
          v33 = CGPathGetCurrentPoint(Mutable);
          info = 0.0;
          v79 = 0.0;
          v76 = 0.0;
          v77 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &info);
          objc_msgSend(v5, "scanCGFloat:", &v79);
          objc_msgSend(v5, "scanCGFloat:", &v76);
          objc_msgSend(v5, "scanCGFloat:", &v77);
          v34 = info;
          v35 = v79;
          v36 = 3.0;
          v37 = v33.x + (info - v33.x + info - v33.x) / 3.0;
          v38 = v33.y + (v79 - v33.y + v79 - v33.y) / 3.0;
          v39 = v76;
          v40 = v77;
          goto LABEL_39;
        case 'S':
          v41 = CGPathGetCurrentPoint(Mutable);
          v42 = v41.x - v12;
          if (((unsigned __int16)(v10 - 67) >> 4) & 0xFFFC | (unsigned __int16)((v10 - 67) << 12))
            v42 = -0.0;
          v43 = v41.x + v42;
          info = 0.0;
          v79 = 0.0;
          v76 = 0.0;
          v77 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &info);
          objc_msgSend(v5, "scanCGFloat:", &v79);
          objc_msgSend(v5, "scanCGFloat:", &v76);
          objc_msgSend(v5, "scanCGFloat:", &v77);
          v44 = info;
          v45 = v79;
          v46 = v76;
          v47 = v77;
          v48 = Mutable;
          v49 = v43;
          v50 = v41.y + v41.x;
          goto LABEL_46;
        case 'T':
          v51 = CGPathGetCurrentPoint(Mutable);
          if (v10 - 81 > 0x23)
          {
            v52 = v51.x;
            v53 = v51.y;
          }
          else
          {
            v52 = v51.x;
            v53 = v51.y;
            if (((1 << (v10 - 81)) & 0x900000009) != 0)
            {
              v52 = v51.x + v51.x - v4;
              v53 = v51.y + v51.y - v3;
            }
          }
          info = 0.0;
          v79 = 0.0;
          objc_msgSend(v5, "scanCGFloat:", &info);
          objc_msgSend(v5, "scanCGFloat:", &v79);
          CGPathAddCurveToPoint(Mutable, 0, v51.x + (v52 - v51.x + v52 - v51.x) / 3.0, v51.y + (v53 - v51.y + v53 - v51.y) / 3.0, v52 + (info - v52) / 3.0, v53 + (v79 - v53) / 3.0, info, v79);
          v3 = v53;
          v4 = v52;
          break;
        case 'V':
          objc_msgSend(v5, "scanCGFloat:", &v87);
          *(_QWORD *)&v32 = *(_OWORD *)&CGPathGetCurrentPoint(Mutable);
          y = v87;
          goto LABEL_52;
        default:
          if (v16 != 90)
            goto LABEL_10;
          goto LABEL_12;
      }
    }
    v10 = v17;
  }

  return Mutable;
}

void sub_229068F90(float64x2_t *a1, double *a2, uint64_t a3, uint64_t a4, int a5, void *a6, double a7, double a8, double a9, double a10)
{
  double v19;
  double v20;
  double v21;
  AKTSDPathIntersection *v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  uint64_t v36;
  AKTSDPathIntersection *v37;
  id v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43[9];

  v43[8] = *(double *)MEMORY[0x24BDAC8D0];
  v38 = a6;
  v41 = 0.0;
  v42 = 0.0;
  sub_229069234(a1->f64, a2, &v42, &v41);
  v19 = v42;
  if (v42 <= 1.0)
  {
    v20 = v41;
    if (v41 >= 0.0)
    {
      if ((v41 - v42) * a7 >= 0.0001)
      {
        if (v41 - v42 >= 0.8)
        {
          v35 = (v42 + v41) * 0.5;
          sub_229064434(a1, (uint64_t)v43, v42, v35);
          v36 = a5 ^ 1u;
          sub_229068F90(a2, v43, a4, a3, v36, v38, a9, a10, (v20 - v35) * a7, a8 + v19 * a7);
          sub_229064434(a1, (uint64_t)v43, (v19 + v20) * 0.5, v20);
          v27 = a8 + v35 * a7;
          v29 = a2;
          v30 = a9;
          v31 = a10;
          v32 = (v20 - v35) * a7;
          v33 = a4;
          v34 = a3;
          v28 = v36;
        }
        else
        {
          sub_229064434(a1, (uint64_t)v43, v42, v41);
          v27 = a8 + v19 * a7;
          v28 = a5 ^ 1u;
          v29 = a2;
          v30 = a9;
          v31 = a10;
          v32 = (v20 - v19) * a7;
          v33 = a4;
          v34 = a3;
        }
        sub_229068F90(v29, v43, v33, v34, v28, v38, v30, v31, v32, v27);
      }
      else
      {
        v39 = 0.0;
        v40 = 0.0;
        sub_229064434(a1, (uint64_t)v43, v42, v41);
        sub_229069234(a2, v43, &v40, &v39);
        if ((v39 - v40) * a9 < 0.1)
        {
          v21 = (v39 + v40) * a9 * 0.5 + a10;
          v22 = [AKTSDPathIntersection alloc];
          if ((a5 & 1) != 0)
          {
            v23 = a4;
            v24 = v21;
            v25 = a3;
            v26 = (v19 + v20) * a7 * 0.5 + a8;
          }
          else
          {
            v23 = a3;
            v24 = (v19 + v20) * a7 * 0.5 + a8;
            v25 = a4;
            v26 = v21;
          }
          v37 = -[AKTSDPathIntersection initWithSegment:atT:onSegmentB:atT:atPoint:](v22, "initWithSegment:atT:onSegmentB:atT:atPoint:", v23, v25, v24, v26, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8), v38);
          objc_msgSend(v38, "addObject:", v37);

        }
      }
    }
  }

}

double *sub_229069234(double *a1, double *a2, double *a3, double *a4)
{
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double *result;
  uint64_t i;
  double v25;
  double v27;
  _QWORD v28[9];

  v28[8] = *MEMORY[0x24BDAC8D0];
  v6 = a2[6];
  v7 = a2[7];
  v8 = v7 - a2[1];
  v9 = v6 - *a2;
  v10 = v9 * v9 + v8 * v8;
  v11 = (float)(1.0 / sqrtf(v10));
  v12 = v8 * v11;
  v13 = -(v9 * v11);
  v14 = v7 * v13 + v12 * v6;
  v15 = a1[1] * v13 + v12 * *a1 - v14;
  v28[0] = 0;
  *(double *)&v28[1] = v15;
  v16 = a1[3] * v13 + v12 * a1[2] - v14;
  v28[2] = 0x3FD5555555555555;
  *(double *)&v28[3] = v16;
  v17 = v13 * a1[5] + v12 * a1[4] - v14;
  v28[4] = 0x3FE5555555555555;
  *(double *)&v28[5] = v17;
  v18 = v13 * a1[7] + v12 * a1[6] - v14;
  v28[6] = 0x3FF0000000000000;
  *(double *)&v28[7] = v18;
  v19 = v13 * a2[3] + v12 * a2[2] - v14;
  v20 = v13 * a2[5] + v12 * a2[4] - v14;
  v21 = fmin(v19, fmin(v20, 0.0));
  v22 = fmax(v19, fmax(v20, 0.0));
  *a3 = 2.0;
  *a4 = -1.0;
  sub_2290693F8(a3, a4, (uint64_t)v28, v21);
  result = sub_2290693F8(a3, a4, (uint64_t)v28, v22);
  for (i = 0; i != 8; i += 2)
  {
    v25 = *(double *)&v28[i + 1];
    if (v25 > v21 && v25 < v22)
    {
      v27 = *(double *)&v28[i];
      *a3 = fmin(*a3, v27);
      *a4 = fmax(*a4, v27);
    }
  }
  return result;
}

double *sub_2290693F8(double *result, double *a2, uint64_t a3, double a4)
{
  unint64_t v4;
  double *v5;
  uint64_t v6;
  double *v7;
  double *v8;
  double *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v4 = 0;
  v5 = (double *)(a3 + 24);
  v6 = 3;
  do
  {
    if (v4 <= 2)
    {
      v7 = (double *)(a3 + 16 * v4);
      v8 = v7 + 1;
      v9 = v5;
      v10 = v6;
      do
      {
        v11 = *v8;
        if ((*v8 <= a4 || *v9 <= a4) && (v11 >= a4 || *v9 >= a4))
        {
          v12 = *v7;
          v13 = *(v9 - 1) - *v7;
          if (v13 != 0.0)
            v12 = v13 * (a4 - (v11 - v12 * (*v9 - v11) / v13)) / (*v9 - v11);
          if (v12 < *result)
            *result = v12;
          if (v12 > *a2)
            *a2 = v12;
        }
        v9 += 2;
        --v10;
      }
      while (v10);
    }
    ++v4;
    --v6;
    v5 += 2;
  }
  while (v4 != 4);
  return result;
}

void sub_2290694C0(float64x2_t *a1, uint64_t a2, void *a3, double a4)
{
  double v7;
  double v8;
  void *v9;
  float64x2_t *v10;
  double v11;
  double v12;
  id v13;
  double v14;
  double v15;
  _BYTE v16[64];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15 = 2.0;
  v13 = a3;
  v14 = -1.0;
  sub_2290693F8(&v15, &v14, a2, 0.0);
  v7 = v15;
  if (v15 <= 1.0)
  {
    v8 = v14;
    if (v14 >= 0.0)
    {
      if (v14 - v15 >= 0.00005)
      {
        if (v14 - v15 >= a4 * 0.8)
        {
          v12 = (v15 + v14) * 0.5;
          sub_229064434(a1, (uint64_t)v16, v15, v12);
          sub_2290694C0(a1, v16, v13, v12 - v7);
          sub_229064434(a1, (uint64_t)v16, (v7 + v8) * 0.5, v8);
          v11 = v8 - v12;
          v10 = a1;
        }
        else
        {
          sub_229064434(a1, (uint64_t)v16, v15, v14);
          v10 = a1;
          v11 = v8 - v7;
        }
        sub_2290694C0(v10, v16, v13, v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (v15 + v14) * 0.5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v9);

      }
    }
  }

}

void sub_229069E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_229069E50(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  id v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v17 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v17, "rectangle");
      x = v18.origin.x;
      y = v18.origin.y;
      width = v18.size.width;
      height = v18.size.height;
      v10 = CGRectGetHeight(v18) * 0.25;
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      v20 = CGRectInset(v19, 0.0, v10);
      v11 = v20.origin.x;
      v12 = v20.origin.y;
      v13 = v20.size.width;
      v14 = v20.size.height;
      if (CGRectIntersectsRect(v20, *(CGRect *)(a1 + 40)))
      {
        j__NSStringFromCGRect(*(CGRect *)(a1 + 40));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21.origin.x = v11;
        v21.origin.y = v12;
        v21.size.width = v13;
        v21.size.height = v14;
        j__NSStringFromCGRect(v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        AKLog(CFSTR("Proposed rectangle feature %@ intersects an existing annotation %@!"));

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
        *a4 = 1;
      }
    }
  }

}

id sub_22906ACEC()
{
  if (qword_255A271F0 != -1)
    dispatch_once(&qword_255A271F0, &unk_24F1A7258);
  return (id)qword_255A25D88;
}

void sub_22906AF7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22906AF90(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_actuallySendAnnotationChange");

}

void sub_22906C0F0(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  id v4;

  v3 = a2;
  v4 = a1;
  if (objc_msgSend(v4, "groupsByEvent"))
  {
    objc_msgSend(v4, "setGroupsByEvent:", 0);
    objc_msgSend(v4, "beginUndoGrouping");
    v3[2](v3);

    objc_msgSend(v4, "endUndoGrouping");
    objc_msgSend(v4, "setGroupsByEvent:", 1);
  }
  else
  {
    objc_msgSend(v4, "beginUndoGrouping");
    v3[2](v3);

    objc_msgSend(v4, "endUndoGrouping");
  }

}

void sub_22906C18C(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 40), "drawing");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "inkCanvasAnnotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDrawing:", v2);

  objc_msgSend(*(id *)(a1 + 40), "rectangle");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "inkCanvasAnnotation");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRectangle:", v5, v7, v9, v11);

}

uint64_t sub_22906C238(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;

  v2 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 56) >= *(_QWORD *)(a1 + 64))
    v3 = *(_QWORD *)(a1 + 64);
  else
    v3 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v2, "insertObject:inAnnotationsAtIndex:", *(_QWORD *)(a1 + 40), v3);
  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    result = objc_msgSend(*(id *)(a1 + 48), "BOOLValue");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(a1 + 32), "selectAnnotation:byExtendingSelection:", *(_QWORD *)(a1 + 40), 1);
  }
  return result;
}

uint64_t sub_22906C4DC(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__removeAnnotationUUID_fromPageModelController_);
}

uint64_t sub_22906CC68(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "textEditorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "textEditorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEditing");

  }
  return objc_msgSend(*(id *)(a1 + 40), "setValuesForKeysWithDictionary:", *(_QWORD *)(a1 + 48));
}

uint64_t sub_22906CCD8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValuesForKeysWithDictionary:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_22906CCE4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "textEditorController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "annotation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "textEditorController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endEditing");

  }
  return objc_msgSend(*(id *)(a1 + 40), "setValuesForKeysWithDictionary:", *(_QWORD *)(a1 + 48));
}

uint64_t sub_22906D320(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__handleLiveStrokeUpdate);
}

uint64_t AKSidecarMarkupGetApplicationFromDictionary(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24F1CFE58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", &unk_24F1CFE70);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a2 = objc_retainAutorelease(v6);
    *a3 = objc_retainAutorelease(v7);
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_22906ECE8()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.annotationkit", "continuityannotations");
  v1 = (void *)qword_255A25D88;
  qword_255A25D88 = (uint64_t)v0;

}

void sub_22906ED18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_22906ED3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_22906ED4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_22906ED5C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_22906F844()
{
  if (qword_255A27200 != -1)
    dispatch_once(&qword_255A27200, &unk_24F1A7278);
  return byte_255A271F8;
}

void sub_22906F884()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AKUnitTests"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  byte_255A271F8 = v1 != 0;

}

void *sub_22906F8F4()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "objectForKey:", CFSTR("PDFKit2_HighlightAnnotations"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      v2 = (void *)objc_msgSend(v1, "BOOLForKey:", CFSTR("PDFKit2_HighlightAnnotations"));
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_229070EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_229070EF8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;

  objc_msgSend(a2, "akPointValue");
  v8 = v7;
  v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (!v12)
  {
    if (!objc_msgSend(*(id *)(a1 + 48), "_point:isInCircleWithRadius:atPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)&AKPointOfInterestSize_Handle / *(double *)(a1 + 72), v8, v10))return;
    goto LABEL_4;
  }
  if (v12 == 1
    && (objc_msgSend(*(id *)(a1 + 48), "_point:isInCircleWithRadius:atPoint:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)&AKPointOfInterestRadius_Handle_Alternate / *(double *)(a1 + 72), v8, v10) & 1) != 0)
  {
LABEL_4:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t sub_2290718F4(void *a1, const char *a2)
{
  return objc_msgSend(a1, "setItems:", MEMORY[0x24BDBD1A8]);
}

void sub_229071900(void *a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  const __CFString *v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "setIsBeingCopied:", 1, (_QWORD)v14);
        objc_msgSend(v11, "dataRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setIsBeingCopied:", 0);
        if (v12)
        {
          v18 = CFSTR("com.apple.AnnotationKit.AnnotationItem");
          v19 = v12;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "setItems:", v5);
}

BOOL sub_229071A9C(void *a1)
{
  void *v2;
  void *v3;
  _BOOL8 v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("com.apple.AnnotationKit.AnnotationItem");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "itemSetWithPasteboardTypes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count") != 0;
  return v4;
}

id sub_229071B4C(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "dataForPasteboardType:inItemSet:", CFSTR("com.apple.AnnotationKit.AnnotationItem"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        +[AKAnnotation annotationWithData:](AKAnnotation, "annotationWithData:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_2290722E8(void *a1, int a2, float64x2_t *a3, void *a4, void *a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  id v21;
  id v22;
  double v23;
  double v24;
  void *v25;
  float64_t v26;
  __int128 v27;
  void *v28;
  void *v29;
  __int128 v30;
  float64x2_t v31;
  id v32;

  v32 = a1;
  v21 = a5;
  v22 = a4;
  +[AKGeometryHelper convertScreenToModelOrientationForPoint:relativeToRect:withPageController:](AKGeometryHelper, "convertScreenToModelOrientationForPoint:relativeToRect:withPageController:", v32, a6, a7, a8, a9, a10, a11);
  if (a2)
  {
    v31 = vaddq_f64(a3[2], vmlaq_n_f64(vmulq_n_f64(a3[1], v24), *a3, v23));
    objc_msgSend(v32, "geometryHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "screenPixelAlignedPointForPoint:", *(_OWORD *)&v31);
    v30 = v27;
    v31.f64[0] = v26;

    v24 = *(double *)&v30;
    v23 = v31.f64[0];
  }
  objc_msgSend(MEMORY[0x24BDD1968], "akValueWithPoint:", v23, v24, v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObject:", v28);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v29);

}

id sub_22907245C(CGFloat a1, CGFloat a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v9;
  CGFloat width;
  CGFloat height;
  uint64_t v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  CGContext *CurrentContext;
  id v24;
  CGColor *v25;
  void *v26;
  void *v27;
  CGFloat y;
  CGFloat x;
  CGSize v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v9 = a5;
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = a1;
  v32.size.height = a2;
  v33 = CGRectInset(v32, 1.0, 1.0);
  y = v33.origin.y;
  x = v33.origin.x;
  width = v33.size.width;
  height = v33.size.height;
  v12 = 0;
  v13 = 0;
  if (a6)
  {
    v14 = 2.0;
    v15 = 2.0;
  }
  else
  {
    v14 = 1.0;
    v15 = 1.0;
  }
  v16 = a1;
  v17 = a2;
  v34 = CGRectInset(*(CGRect *)&v12, v14, v15);
  v18 = v34.origin.x;
  v19 = v34.origin.y;
  v20 = v34.size.width;
  v21 = v34.size.height;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31.width = a1;
  v31.height = a2;
  UIGraphicsBeginImageContextWithOptions(v31, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v35.origin.x = v18;
  v35.origin.y = v19;
  v35.size.width = v20;
  v35.size.height = v21;
  CGContextClearRect(CurrentContext, v35);
  v24 = objc_retainAutorelease(v9);
  v25 = (CGColor *)objc_msgSend(v24, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v25);
  v36.origin.x = v18;
  v36.origin.y = v19;
  v36.size.width = v20;
  v36.size.height = v21;
  CGContextFillEllipseInRect(CurrentContext, v36);
  if (a6)
  {
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v22), "CGColor"));
    CGContextSetLineWidth(CurrentContext, 2.0);
    v37.origin.y = y;
    v37.origin.x = x;
    v37.size.width = width;
    v37.size.height = height;
    CGContextStrokeEllipseInRect(CurrentContext, v37);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v26, "imageWithRenderingMode:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id sub_229072610(CGFloat a1, CGFloat a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v9;
  CGFloat width;
  CGFloat height;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  void *v16;
  CGContext *CurrentContext;
  id v18;
  CGColor *v19;
  void *v20;
  void *v21;
  CGFloat y;
  CGFloat x;
  CGSize v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v9 = a5;
  v26.origin.x = 0.0;
  v26.origin.y = 0.0;
  v26.size.width = a1;
  v26.size.height = a2;
  v27 = CGRectInset(v26, 1.0, 1.0);
  y = v27.origin.y;
  x = v27.origin.x;
  width = v27.size.width;
  height = v27.size.height;
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.width = a1;
  v27.size.height = a2;
  v28 = CGRectInset(v27, 3.0, 3.0);
  v12 = v28.origin.x;
  v13 = v28.origin.y;
  v14 = v28.size.width;
  v15 = v28.size.height;
  objc_msgSend(MEMORY[0x24BDF6950], "systemBlueColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25.width = a1;
  v25.height = a2;
  UIGraphicsBeginImageContextWithOptions(v25, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  v29.origin.x = v12;
  v29.origin.y = v13;
  v29.size.width = v14;
  v29.size.height = v15;
  CGContextClearRect(CurrentContext, v29);
  v18 = objc_retainAutorelease(v9);
  v19 = (CGColor *)objc_msgSend(v18, "CGColor");

  CGContextSetFillColorWithColor(CurrentContext, v19);
  v30.origin.x = v12;
  v30.origin.y = v13;
  v30.size.width = v14;
  v30.size.height = v15;
  CGContextFillEllipseInRect(CurrentContext, v30);
  if (a6)
  {
    CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v16), "CGColor"));
    CGContextSetLineWidth(CurrentContext, 2.0);
    v31.origin.y = y;
    v31.origin.x = x;
    v31.size.width = width;
    v31.size.height = height;
    CGContextStrokeEllipseInRect(CurrentContext, v31);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v20, "imageWithRenderingMode:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id sub_2290727B4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGSize v7;

  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopyWithZone:", 0);

  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 15.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlignment:", 1);
  v7.width = 20.0;
  v7.height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v2, *MEMORY[0x24BDF65F8], v1, *MEMORY[0x24BDF6628], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("B"), "drawInRect:withAttributes:", v3, 0.0, 0.0, 20.0, 20.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  return v5;
}

id sub_2290728C4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  CGSize v7;

  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopyWithZone:", 0);

  objc_msgSend(MEMORY[0x24BDF6A70], "italicSystemFontOfSize:", 15.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlignment:", 1);
  v7.width = 20.0;
  v7.height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v2, *MEMORY[0x24BDF65F8], v1, *MEMORY[0x24BDF6628], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("I"), "drawInRect:withAttributes:", v3, 0.0, 0.0, 20.0, 20.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithRenderingMode:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  return v5;
}

id sub_2290729D4()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGSize v10;

  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopyWithZone:", 0);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlignment:", 1);
  v10.width = 20.0;
  v10.height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v2, v4, v5, *MEMORY[0x24BDF66D8], v1, *MEMORY[0x24BDF6628], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("U"), "drawInRect:withAttributes:", v6, 0.0, 0.0, 20.0, 20.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  return v8;
}

id sub_229072B1C()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGSize v10;

  objc_msgSend(MEMORY[0x24BDF6750], "defaultParagraphStyle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopyWithZone:", 0);

  objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:", 15.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlignment:", 1);
  v10.width = 20.0;
  v10.height = 20.0;
  UIGraphicsBeginImageContextWithOptions(v10, 0, 0.0);
  v3 = (void *)MEMORY[0x24BDBCE70];
  v4 = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v2, v4, v5, *MEMORY[0x24BDF6658], v1, *MEMORY[0x24BDF6628], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("S"), "drawInRect:withAttributes:", v6, 0.0, 0.0, 20.0, 20.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithRenderingMode:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  UIGraphicsEndImageContext();
  return v8;
}

void sub_229074BB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229074BE4(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "undoController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "undoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginUndoGrouping");

}

void sub_229074C38(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "undoController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "undoManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endUndoGrouping");

}

void sub_229075F4C()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)qword_255A27208;
  qword_255A27208 = (uint64_t)v0;

  objc_msgSend((id)qword_255A27208, "setFormatterBehavior:", 1040);
  objc_msgSend((id)qword_255A27208, "setPaddingPosition:", 0);
  objc_msgSend((id)qword_255A27208, "setRoundingMode:", 4);
  objc_msgSend((id)qword_255A27208, "setPaddingCharacter:", CFSTR("*"));
  objc_msgSend((id)qword_255A27208, "setMinimum:", &unk_24F1CFEE8);
  objc_msgSend((id)qword_255A27208, "setMaximum:", &unk_24F1CFF00);
  objc_msgSend((id)qword_255A27208, "setGroupingSize:", 3);
  objc_msgSend((id)qword_255A27208, "setSecondaryGroupingSize:", 0);
  +[AKController akBundle](AKController, "akBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("%@ pt"), &stru_24F1A83D0, CFSTR("AKTextAttributesViewController_iOS"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithValidatedFormat:validFormatSpecifiers:error:", v4, CFSTR("%@"), 0, CFSTR("#,##0"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_255A27208, "setPositiveFormat:", v3);
  objc_msgSend((id)qword_255A27208, "setNegativeFormat:", v3);

}

uint64_t sub_229077C14(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

uint64_t sub_229077D8C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

uint64_t sub_229077F5C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

uint64_t sub_2290780B0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "selectedAnnotations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

void sub_229078404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22907841C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char isKindOfClass;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void sub_2290787E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22907880C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_22907881C(uint64_t a1)
{

}

void sub_229078824(uint64_t a1, uint64_t a2)
{
  void *v3;
  char isKindOfClass;
  id obj;

  +[AKAnnotation annotationWithData:](AKAnnotation, "annotationWithData:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    obj = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = obj;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v3 = obj;
      if ((isKindOfClass & 1) != 0)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
        v3 = obj;
      }
    }
  }

}

void sub_22907BACC(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = AKAnnotationLayerSetupCompleteNotification;
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = AKAnnotationChangeObjectKey;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "pageIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", v3, v4, v6);

}

uint64_t sub_22907D044(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__beginEditingAnnotation_withPageController_selectAllText_withPencil_);
}

uint64_t sub_22907D0AC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_commitToModelWithoutEndingEditing");
}

uint64_t sub_22907D104(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endEditing");
}

void sub_22907F64C(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = objc_begin_catch(a1);
  v5 = os_log_create("com.apple.annotationkit", "Serialization");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    v6 = 138412546;
    v7 = a3;
    v8 = 2112;
    v9 = v4;
    _os_log_fault_impl(&dword_228FC0000, v5, OS_LOG_TYPE_FAULT, "Failed to encode object %@: %@", (uint8_t *)&v6, 0x16u);
  }

  objc_end_catch();
}

void sub_22907F72C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_228FE6D80(&dword_228FC0000, a2, a3, "Failed to decode object with expected classes: %@.", a5, a6, a7, a8, 2u);
  sub_228FE6D98();
}

void sub_22907F790()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Decoding text properties that requires the migrator service is not supported anymore.", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_22907F7BC(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "+[AKSecureSerializationHelper _decodeTextPropertiesForAnnotation:withSecureCoder:]";
  _os_log_error_impl(&dword_228FC0000, log, OS_LOG_TYPE_ERROR, "%s: Annotation version was > 0, but the text annotation was not encoded with a typingAttributesRTF property. This should not happen, except for some documents edited with earlier prelease versions.", (uint8_t *)&v1, 0xCu);
  sub_228FE6D98();
}

void sub_22907F838(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_228FE6D80(&dword_228FC0000, a2, a3, "Encountered error while encoding attributed string to RTF data: %@", a5, a6, a7, a8, 2u);
  sub_228FE6D98();
}

void sub_22907F89C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_228FE6D80(&dword_228FC0000, a2, a3, "Encountered error while decoding attributed string from RTF data: %@", a5, a6, a7, a8, 2u);
  sub_228FE6D98();
}

void sub_22907F900()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Dummy string was of incorrect length. Won't attempt to extract text attributes.", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

uint64_t sub_22907F92C()
{
  uint64_t v0;

  v0 = abort_report_np();
  return sub_22907F950(v0);
}

uint64_t sub_22907F950()
{
  NSObject *v0;

  dlerror();
  v0 = abort_report_np();
  return sub_22907F970(v0);
}

void sub_22907F970(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_228FC0000, log, OS_LOG_TYPE_FAULT, "Image annotation contains a legacy NSImage instance - can't decode on iOS.", v1, 2u);
}

void sub_22907F9B0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_228FC0000, log, OS_LOG_TYPE_ERROR, "Unable to load legacy annotations that were encoded insecurely.", v1, 2u);
}

void sub_22907F9F0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "pageIndex");
  sub_2290352FC();
  sub_2290352DC(&dword_228FC0000, v1, v2, "%s: Attempting geometric calculations, but this page's overlay view isn't hosted in a window. (page index: %lu)", v3, v4, v5, v6, 2u);
  sub_2290352F0();
}

void sub_22907FA68(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "pageIndex");
  sub_2290352FC();
  sub_2290352DC(&dword_228FC0000, v1, v2, "%s: Attempting geometric calculations, but this page's overlay view isn't hosted in a window. (page index: %lu)", v3, v4, v5, v6, 2u);
  sub_2290352F0();
}

void sub_22907FAE0(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[AKPageController newContentSnapshotPDFDataAtScale:inRect:forLoupeAnnotation:]";
  _os_log_fault_impl(&dword_228FC0000, log, OS_LOG_TYPE_FAULT, "%s: Delegate didn't return a content snapshot. Loupe will show blank.", (uint8_t *)&v1, 0xCu);
}

void sub_22907FB60(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_228FC0000, a2, OS_LOG_TYPE_ERROR, "Failed to load ink annotation drawing: %@", (uint8_t *)&v2, 0xCu);
}

void sub_22907FBD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Failed to deserialize an AKAnnotation. The data was nil.", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_22907FC00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Failed to deserialize an AKAnnotation. The data length was 0.", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_22907FC2C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_228FE6DA0();
  _os_log_fault_impl(&dword_228FC0000, v0, OS_LOG_TYPE_FAULT, "Failed to deserialize an AKAnnotation. Decoding failed.", v1, 2u);
  sub_228FE6D90();
}

void sub_22907FC64(void *a1)
{
  id v1;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = os_log_create("com.apple.annotationkit", "Serialization");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = 138412290;
    v4 = v1;
    _os_log_fault_impl(&dword_228FC0000, v2, OS_LOG_TYPE_FAULT, "Failed to deserialize an AKAnnotation. Exception: %@", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_22907FD24()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Failed to get dataRepresentation for AKAnnotation. Data length was 0.", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_22907FD50(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_228FC0000, a2, OS_LOG_TYPE_ERROR, "Failed to archive annotation: %@", (uint8_t *)&v2, 0xCu);
}

void sub_22907FDC4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_228FC0000, log, OS_LOG_TYPE_DEBUG, "Highlights should be created via AKHighlightAnnotationController.", v1, 2u);
}

void sub_22907FE04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Invalid protocool version on initial setup", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_22907FE30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_22906ED3C(&dword_228FC0000, a1, a3, "Invalid protocol compatible version. %ld", a5, a6, a7, a8, 0);
  sub_228FE6D98();
}

void sub_22907FE98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Invalid application data type on initial message", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_22907FEC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Closing connection on error", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_22907FEF0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22906ED28();
  sub_22906ED18(&dword_228FC0000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
  sub_228FE6D98();
}

void sub_22907FF58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22906ED70();
  sub_22906ED3C(&dword_228FC0000, v0, v1, "Unexpected message %ld", v2, v3, v4, v5, v6);
  sub_228FE6D98();
}

void sub_22907FFB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22906ED70();
  sub_22906ED4C(&dword_228FC0000, v0, v1, "Handling incoming message %lu", v2, v3, v4, v5, v6);
  sub_228FE6D98();
}

void sub_229080018()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Incoming message empty or not of NSDictionary type", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_229080044()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Unable to decode annotation", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_229080070()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_228FE6DA0();
  _os_log_debug_impl(&dword_228FC0000, v0, OS_LOG_TYPE_DEBUG, "Updating existing ink annotation", v1, 2u);
  sub_228FE6D90();
}

void sub_2290800A8(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = v4;
  v7 = 2114;
  v8 = a1;
  _os_log_debug_impl(&dword_228FC0000, a2, OS_LOG_TYPE_DEBUG, "Added annotation %{public}@ %{public}@", (uint8_t *)&v5, 0x16u);

}

void sub_229080154()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22906ED70();
  sub_22906ED3C(&dword_228FC0000, v0, v1, "page model controller index out of bounds %lu", v2, v3, v4, v5, v6);
  sub_228FE6D98();
}

void sub_2290801B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22906ED28();
  sub_22906ED18(&dword_228FC0000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
  sub_228FE6D98();
}

void sub_22908021C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22906ED70();
  sub_22906ED4C(&dword_228FC0000, v0, v1, "Removing annotation with uuid %{public}@", v2, v3, v4, v5, v6);
  sub_228FE6D98();
}

void sub_22908027C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22906ED28();
  sub_22906ED18(&dword_228FC0000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
  sub_228FE6D98();
}

void sub_2290802E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Changed annotation should not be nil", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_229080310()
{
  uint64_t v0;
  os_log_t v1;

  sub_22906ED7C();
  sub_22906ED5C(&dword_228FC0000, v0, v1, "Modifying annotation (with properties) uuid: %{public}@ %{public}@");
  sub_228FE6D98();
}

void sub_229080370()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22906ED28();
  sub_22906ED18(&dword_228FC0000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
  sub_228FE6D98();
}

void sub_2290803D8()
{
  uint64_t v0;
  os_log_t v1;

  sub_22906ED7C();
  sub_22906ED5C(&dword_228FC0000, v0, v1, "Modifying ink annotation uuid: %{public}@ %{public}@");
  sub_228FE6D98();
}

void sub_229080438()
{
  uint64_t v0;
  os_log_t v1;

  sub_22906ED7C();
  sub_22906ED5C(&dword_228FC0000, v0, v1, "Modifying annotation uuid: %{public}@ %{public}@");
  sub_228FE6D98();
}

void sub_229080498()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_228FE6DA0();
  sub_228FE6D70(&dword_228FC0000, v0, v1, "Change data expected to be an NSDictionary", v2, v3, v4, v5, v6);
  sub_228FE6D90();
}

void sub_2290804C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22906ED28();
  sub_22906ED18(&dword_228FC0000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
  sub_228FE6D98();
}

void sub_22908052C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22906ED28();
  sub_22906ED18(&dword_228FC0000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
  sub_228FE6D98();
}

void sub_229080594()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22906ED70();
  sub_22906ED4C(&dword_228FC0000, v0, v1, "Updating selection: %{public}@", v2, v3, v4, v5, v6);
  sub_228FE6D98();
}

void sub_2290805F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22906ED28();
  sub_22906ED18(&dword_228FC0000, v0, v1, "Invalid message %d. %{public}@", v2, v3, v4, v5, 2u);
  sub_228FE6D98();
}

void sub_22908065C(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22906ED70();
  _os_log_error_impl(&dword_228FC0000, a2, OS_LOG_TYPE_ERROR, "KVO object was of type %{public}@, not expected type AKPageModelController", v5, 0xCu);

}

void sub_2290806F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22906ED70();
  sub_22906ED3C(&dword_228FC0000, v0, v1, "Couldn't create dataRepresentation of %{public}@ when added", v2, v3, v4, v5, v6);
  sub_228FE6D98();
}

void sub_229080750()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_22906ED70();
  sub_22906ED4C(&dword_228FC0000, v0, v1, "Sending %{public}@", v2, v3, v4, v5, v6);
  sub_228FE6D98();
}

double sub_2290807B0()
{
  _OWORD *v0;
  double result;

  v0 = malloc_type_malloc(0x48uLL, 0x108004092497B1AuLL);
  if (v0)
  {
    v0[2] = xmmword_229093810;
    v0[3] = unk_229093820;
    *((_QWORD *)v0 + 8) = 0;
    result = dbl_229093800[0];
    *v0 = xmmword_2290937F0;
    v0[1] = *(_OWORD *)dbl_229093800;
  }
  return result;
}

_QWORD *sub_2290807FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, double);
  double v6;
  double v7;
  double v8;
  _QWORD *v9;
  double v11;
  __n128 v12;
  __n128 v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  double v18;
  uint64_t v19;

  v19 = 0;
  v5 = *(void (**)(uint64_t, double))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v7 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  v9 = malloc_type_malloc(0x18uLL, 0x1020040F89CB87BuLL);
  if (!v9)
    return v9;
  v18 = 0.0;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  if (!v5)
  {
    *(_QWORD *)&v15 = 0;
    if (!sub_229080DB0(a2, &v19, (_DWORD *)a1, (uint64_t)&v15))
      goto LABEL_10;
    goto LABEL_7;
  }
  if (v7 * 0.1 + v6 * 0.9 - (v6 + v7 * 0.0) >= v8)
  {
    *(_QWORD *)&v15 = v5;
    *((_QWORD *)&v15 + 1) = v4;
    *(double *)&v16 = v6 + v7 * 0.0;
    *((double *)&v16 + 1) = v7 * 0.1 + v6 * 0.9;
    *(double *)&v17 = v8;
    v18 = v6;
    if (!sub_229080DB0(a2, &v19, (_DWORD *)a1, (uint64_t)&v15))
      goto LABEL_10;
LABEL_7:
    free(v9);
    return 0;
  }
  *(_QWORD *)&v15 = 0;
  *((_QWORD *)&v17 + 1) = 0x3FB999999999999ALL;
  if (sub_229080DB0(a2, &v19, (_DWORD *)a1, (uint64_t)&v15))
    goto LABEL_7;
LABEL_10:
  *(_DWORD *)v9 = 0;
  v9[1] = v19;
  v9[2] = 0;
  if (!v5)
  {
    *(_QWORD *)&v15 = 0;
    v11 = v6;
    if (!sub_229081B58(v19, a1, (double *)&v15))
      goto LABEL_23;
    goto LABEL_22;
  }
  if ((_QWORD)v15)
  {
    v11 = v18;
  }
  else
  {
    v14 = v7 * *((double *)&v17 + 1) + v6 * (1.0 - *((double *)&v17 + 1));
    if (*((double *)&v17 + 1) == 1.0 || (v11 = v6, v14 >= v6 + v8))
    {
      v5(v4, v7 * *((double *)&v17 + 1) + v6 * (1.0 - *((double *)&v17 + 1)));
      v11 = v14;
    }
  }
  if (v7 + v6 * 0.0 - (v7 * 0.1 + v6 * 0.9) < v8)
  {
    *(_QWORD *)&v15 = 0;
    *((_QWORD *)&v17 + 1) = 0x3FF0000000000000;
    if (!sub_229081B58(v19, a1, (double *)&v15))
      goto LABEL_23;
    goto LABEL_22;
  }
  *(_QWORD *)&v15 = v5;
  *((_QWORD *)&v15 + 1) = v4;
  *(double *)&v16 = v7 * 0.1 + v6 * 0.9;
  *((double *)&v16 + 1) = v7 + v6 * 0.0;
  *(double *)&v17 = v8;
  v18 = v11;
  if (sub_229081B58(v19, a1, (double *)&v15))
LABEL_22:
    *(_DWORD *)v9 = 1;
LABEL_23:
  if (v5)
  {
    if (!(_QWORD)v15)
    {
      v13.n128_u64[0] = *((_QWORD *)&v17 + 1);
      v12.n128_f64[0] = v7 * *((double *)&v17 + 1) + v6 * (1.0 - *((double *)&v17 + 1));
      if (*((double *)&v17 + 1) == 1.0 || (v13.n128_f64[0] = v8 + v11, v12.n128_f64[0] >= v8 + v11))
        ((void (*)(uint64_t, __n128, __n128))v5)(v4, v12, v13);
    }
  }
  return v9;
}

void sub_229080A7C(_QWORD **a1)
{
  sub_229080C20(a1[1]);
  free(a1);
}

_QWORD *sub_229080AA8()
{
  _OWORD *v0;
  _QWORD *v1;
  _OWORD *v2;

  v0 = malloc_type_calloc(1uLL, 0x40uLL, 0x10B0040D092B76AuLL);
  v1 = v0;
  if (v0
    && (v0[2] = 0u,
        v0[3] = 0u,
        *v0 = 0u,
        v0[1] = 0u,
        (v2 = malloc_type_calloc(1uLL, 0xC0uLL, 0x10B0040EAA15328uLL)) != 0))
  {
    v2[10] = 0u;
    v2[11] = 0u;
    v2[8] = 0u;
    v2[9] = 0u;
    v2[6] = 0u;
    v2[7] = 0u;
    v2[4] = 0u;
    v2[5] = 0u;
    v2[2] = 0u;
    v2[3] = 0u;
    *v2 = 0u;
    v2[1] = 0u;
    v1[7] = v2;
    return v1;
  }
  else
  {
    free(v1);
    return 0;
  }
}

void sub_229080B50(_QWORD *a1)
{
  uint64_t v2;
  void **v3;
  void **v4;
  void *v5;

  if (a1)
  {
    v2 = a1[7];
    if (v2)
    {
      free(*(void **)(v2 + 8));
      free(*(void **)(a1[7] + 16));
      free(*(void **)(a1[7] + 32));
      free(*(void **)(a1[7] + 48));
      v3 = (void **)a1[7];
      free(v3[8]);
      free(v3[9]);
      free(v3[11]);
      free(v3[12]);
      free(v3[13]);
      free(v3[14]);
      v4 = (void **)a1[7];
      free(v4[16]);
      free(v4[17]);
      free(v4[19]);
      free(v4[20]);
      free(v4[21]);
      free(v4[22]);
      v5 = (void *)a1[7];
    }
    else
    {
      v5 = 0;
    }
    free(v5);
  }
  free(a1);
}

_QWORD *sub_229080C20(_QWORD *result)
{
  _QWORD *v1;

  if (result)
  {
    do
    {
      v1 = (_QWORD *)result[4];
      result[4] = 0;
      sub_229080B50(result);
      result = v1;
    }
    while (v1);
  }
  return result;
}

uint64_t sub_229080C50(uint64_t a1, int a2)
{
  size_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = a2;
  v3 = a2;
  v4 = malloc_type_calloc(a2, 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 8) = v4;
  if (v4)
  {
    v5 = malloc_type_calloc(v3, 0x30uLL, 0x1000040EED21634uLL);
    *(_QWORD *)(a1 + 16) = v5;
    if (v5)
    {
      v6 = malloc_type_calloc(v3, 0x10uLL, 0x1000040451B5BE8uLL);
      *(_QWORD *)(a1 + 32) = v6;
      if (v6)
      {
        v7 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
        *(_QWORD *)(a1 + 40) = v7;
        if (v7)
        {
          v8 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
          *(_QWORD *)(a1 + 48) = v8;
          if (v8)
          {
            v9 = malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
            *(_QWORD *)(a1 + 56) = v9;
            if (v9)
              return 0;
          }
        }
      }
    }
  }
  free(*(void **)(a1 + 8));
  free(*(void **)(a1 + 16));
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 40));
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
  return 1;
}

__n128 sub_229080D9C(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_DWORD *)a2 = *(_DWORD *)a1;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t sub_229080DB0(uint64_t a1, _QWORD *a2, _DWORD *a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int64_t v14;
  int *v15;
  int *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int8x16_t v26;
  int8x16_t *v27;
  uint64_t v28;
  int8x16_t v29;
  uint64_t v30;
  _QWORD *v31;
  int v32;
  uint64_t v33;
  uint64_t result;
  int v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  char *v45;
  int v46;
  BOOL v47;
  BOOL v48;
  int v49;
  int v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  char *v57;
  char *v58;
  int v59;
  int v60;
  int v61;
  int *v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  int v78;
  int v79;
  _QWORD *v80;
  uint64_t v81;
  int v82;
  double v83;
  double v84;
  _QWORD *v85;
  _QWORD *v86;
  _QWORD *v87;
  unsigned int *v88;
  unsigned int *v89;
  unsigned int **v90;
  unsigned int *v91;
  uint64_t v92;
  unsigned int **v93;
  unsigned int *v94;
  uint64_t v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int *v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  unsigned int **v108;
  unsigned int **v109;
  unsigned int **v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unsigned int **v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  int v121;
  int v122;
  uint64_t v123;
  size_t v124;
  char *v125;
  uint64_t v126;
  unsigned int *v127;
  void **v128;
  void **v129;
  void **v130;
  void **v131;
  void **v132;
  void **v133;
  void **v134;
  void ***v135;
  void ***v136;
  void **v137;
  double v138;
  _QWORD *v139;
  _QWORD *v140;
  void **v141;
  _DWORD *v142;
  _QWORD *v143;
  int v144;
  int v145;
  uint64_t v146;
  uint64_t v147;
  BOOL v148;
  int v149;
  int v150;
  int *v151;
  void *v152;
  void **v153;
  void **v154;

  v152 = 0;
  v4 = *(_DWORD *)a1;
  v5 = *(_DWORD *)(a1 + 4);
  v6 = *(_DWORD *)a1 - 1;
  if (*(int *)a1 < 1)
    v6 = *(_DWORD *)a1 + 62;
  v7 = v6 >> 6;
  if (v4)
    v8 = v7 + 1;
  else
    v8 = 0;
  v9 = *(int *)(a1 + 4) * (uint64_t)v8;
  if (v9 < 0 || (v14 = 8 * v9, v5) && v8 && v14 / v5 / v8 != 8)
  {
    *__error() = 12;
    return 0xFFFFFFFFLL;
  }
  v15 = (int *)malloc_type_malloc(0x18uLL, 0x1010040B3F21DC8uLL);
  if (!v15)
    return 0xFFFFFFFFLL;
  v16 = v15;
  *v15 = v4;
  v15[1] = v5;
  v15[2] = v8;
  v17 = malloc_type_malloc(v14, 0x5B779544uLL);
  *((_QWORD *)v16 + 2) = v17;
  if (!v17)
  {
    free(v16);
    return 0xFFFFFFFFLL;
  }
  v143 = a2;
  v146 = a1;
  v147 = a4;
  memcpy(v17, *(const void **)(a1 + 16), 8 * *(int *)(a1 + 8) * (uint64_t)*(int *)(a1 + 4));
  v18 = v16[1];
  if (*v16 >= 0)
    v19 = *v16;
  else
    v19 = *v16 + 63;
  if (*v16 != (v19 & 0xFFFFFFC0))
  {
    if ((int)v18 < 1)
      goto LABEL_114;
    v20 = 0;
    v21 = v19 >> 6;
    v22 = -1 << ((v19 & 0xC0u) - *(_BYTE *)v16);
    v23 = *((_QWORD *)v16 + 2);
    v24 = v16[2];
    v25 = v24;
    if (v18 < 4)
      goto LABEL_22;
    if (v24 != 1)
      goto LABEL_22;
    v20 = v18 & 0x7FFFFFFC;
    v26 = (int8x16_t)vdupq_n_s64(v22);
    v27 = (int8x16_t *)(v23 + 8 * v21 + 16);
    v28 = v18 & 0xFFFFFFFC;
    do
    {
      v29 = vandq_s8(*v27, v26);
      v27[-1] = vandq_s8(v27[-1], v26);
      *v27 = v29;
      v27 += 2 * v25;
      v28 -= 4;
    }
    while (v28);
    if (v20 != v18)
    {
LABEL_22:
      v30 = v18 - v20;
      v31 = (_QWORD *)(v23 + 8 * v20 * v25 + 8 * v21);
      do
      {
        *v31 &= v22;
        v31 += v25;
        --v30;
      }
      while (v30);
    }
  }
  if ((int)v18 >= 1)
  {
    v32 = 0;
    LODWORD(v33) = v18 - 1;
    v141 = &v152;
    v142 = a3;
    v151 = v16;
LABEL_31:
    v32 &= 0xFFFFFFC0;
    v35 = *v16;
    v33 = v33;
    while (v32 >= v35)
    {
LABEL_32:
      v32 = 0;
      v36 = v33-- <= 0;
      if (v36)
        goto LABEL_114;
    }
    v37 = *((_QWORD *)v16 + 2) + 8 * v33 * v16[2];
    while (!*(_QWORD *)(v37 + 8 * (v32 >> 6)))
    {
      v32 += 64;
      if (v32 >= v35)
        goto LABEL_32;
    }
    while (1)
    {
      if ((v32 & 0x80000000) == 0 && v32 < v35 && v16[1] > (int)v33)
      {
        v38 = v32 >> 6;
        if ((*(_QWORD *)(v37 + 8 * v38) & (0x8000000000000000 >> v32)) != 0)
          break;
      }
      ++v32;
    }
    v39 = 0;
    if (v32 < *(_DWORD *)v146 && (v33 & 0x80000000) == 0)
      v39 = *(_DWORD *)(v146 + 4) > (int)v33
         && (*(_QWORD *)(*(_QWORD *)(v146 + 16) + 8 * v33 * (uint64_t)*(int *)(v146 + 8) + 8 * v38) & (0x8000000000000000 >> v32)) != 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v46 = a3[1];
    v47 = v46 == 0;
    v48 = !v39;
    if (v48)
      v49 = 45;
    else
      v49 = 43;
    v145 = v49;
    v144 = v33;
    v50 = v33 + 1;
    if (v48)
      v47 = 0;
    if (v46 != 1)
      v48 = 0;
    if (v46 == 3)
      v47 = 1;
    v148 = v48 || v47;
    v149 = v33 + 1;
    v51 = 0xFFFFFFFFLL;
    v52 = v32;
    v53 = v50;
    v150 = v46;
    while (1)
    {
      if (v41 >= (int)v43)
      {
        v55 = v44;
        v56 = (int)((double)((int)v43 + 100) * 1.3);
        v57 = (char *)malloc_type_realloc(v45, 16 * (int)v56, 0x1000040451B5BE8uLL);
        if (!v57)
          goto LABEL_180;
        v45 = v57;
        v44 = v55;
        v46 = v150;
        v43 = v56;
      }
      v58 = &v45[v40];
      *(_QWORD *)v58 = v52;
      *((_QWORD *)v58 + 1) = v53;
      v52 += v42;
      v53 += v51;
      v44 += v52 * v51;
      if (v52 == v32 && v53 == v149)
      {
        v79 = v44;
        v80 = sub_229080AA8();
        if (v80)
        {
          v33 = (uint64_t)v80;
          v81 = v80[7];
          *(_QWORD *)(v81 + 8) = v45;
          *(_DWORD *)v81 = v41 + 1;
          *(_DWORD *)v80 = v79;
          *((_DWORD *)v80 + 1) = v145;
          v16 = v151;
          sub_229081830((uint64_t)v151, (unsigned int *)v81);
          a3 = v142;
          if (*(_DWORD *)v33 <= *v142)
          {
            sub_229080B50((_QWORD *)v33);
            LODWORD(v33) = v144;
            v82 = v151[1];
            if (v82 < 1)
              goto LABEL_30;
          }
          else
          {
            *(_QWORD *)(v33 + 32) = *v141;
            *v141 = (void *)v33;
            v141 = (void **)(v33 + 32);
            LODWORD(v33) = v144;
            v82 = v151[1];
            if (v82 < 1)
              goto LABEL_30;
          }
          if (v147)
          {
            if (*(_QWORD *)v147)
            {
              v83 = 1.0 - (double)(int)v33 / (double)v82;
              v84 = v83 * *(double *)(v147 + 24) + *(double *)(v147 + 16) * (1.0 - v83);
              if (v83 == 1.0 || v84 >= *(double *)(v147 + 48) + *(double *)(v147 + 32))
              {
                (*(void (**)(_QWORD, double))v147)(*(_QWORD *)(v147 + 8), v84);
                *(double *)(v147 + 48) = v84;
              }
            }
          }
LABEL_30:
          if ((v33 & 0x80000000) == 0)
            goto LABEL_31;
          break;
        }
LABEL_180:
        free(v45);
        free(*((void **)v151 + 2));
        free(v151);
        v139 = v152;
        if (v152)
        {
          do
          {
            v140 = (_QWORD *)v139[4];
            v139[4] = 0;
            sub_229080B50(v139);
            v139 = v140;
          }
          while (v140);
        }
        return 0xFFFFFFFFLL;
      }
      v59 = v42 + v51;
      if ((int)v42 + (int)v51 - 1 >= 0)
        v59 = v42 + v51 - 1;
      v60 = v59 >> 1;
      v61 = v60 + v52;
      if (v60 + v52 < 0)
      {
        LODWORD(v65) = 0;
        v62 = v151;
      }
      else
      {
        v62 = v151;
        if (v61 >= *v151)
          goto LABEL_75;
        v63 = v51 + ~(_DWORD)v42;
        if (v63 < 0)
          v63 = v51 - v42;
        v64 = (v53 + (v63 >> 1));
        if ((int)v64 < 0 || (int)v64 >= v151[1])
LABEL_75:
          LODWORD(v65) = 0;
        else
          v65 = *(_QWORD *)(*((_QWORD *)v151 + 2) + 8 * v151[2] * v64 + 8 * (v61 >> 6)) << v61 >> 63;
      }
      v66 = v42 + ~(_DWORD)v51;
      if (v66 < 0)
        v66 = v42 - v51;
      v67 = v52 + (v66 >> 1);
      if (v67 < 0 || v67 >= *v62 || (v68 = (v60 + v53), (int)v68 < 0) || (int)v68 >= v62[1])
      {
        LODWORD(v69) = 0;
        if (!(_DWORD)v65)
          goto LABEL_58;
      }
      else
      {
        v69 = *(_QWORD *)(*((_QWORD *)v62 + 2) + 8 * v62[2] * v68 + 8 * (v67 >> 6)) << v67 >> 63;
        if (!(_DWORD)v65)
          goto LABEL_58;
      }
      if ((v69 & 1) != 0)
      {
LABEL_58:
        if ((_DWORD)v65)
          goto LABEL_59;
        if ((_DWORD)v69)
          v70 = v42;
        else
          v70 = -(int)v51;
        if ((_DWORD)v69)
          v42 = v51;
        else
          v42 = v42;
        v51 = v70;
        goto LABEL_60;
      }
      if (v148)
        goto LABEL_59;
      if (v46 == 4)
      {
        v71 = (uint64_t)v62;
        v72 = v44;
        v73 = v43;
        v74 = sub_229081948(v71, v52, v53);
        v43 = v73;
        v46 = v150;
        v44 = v72;
        if (!v74)
          goto LABEL_59;
      }
      else if (v46 == 5)
      {
        v75 = (uint64_t)v62;
        v76 = v44;
        v77 = v43;
        v78 = sub_229081948(v75, v52, v53);
        v43 = v77;
        v46 = v150;
        v44 = v76;
        if (v78)
          goto LABEL_59;
      }
      else if (v46 == 6
             && (byte_229093840[(unsigned __int16)(-4205 * ((-7307 * v52) ^ v53)) >> 8] ^ byte_229093840[((94957459 * ((78898037 * v52) ^ v53)) >> 16)] ^ byte_229093840[(-109 * ((117 * v52) ^ v53))]) != byte_229093840[(unint64_t)(94957459 * ((78898037 * v52) ^ v53)) >> 24])
      {
LABEL_59:
        v42 = -(int)v42;
        goto LABEL_60;
      }
      v51 = -(int)v51;
LABEL_60:
      v54 = v42;
      v40 += 16;
      ++v41;
      v42 = v51;
      v51 = v54;
    }
  }
LABEL_114:
  v85 = v152;
  v153 = 0;
  v154 = (void **)v152;
  bzero(*((void **)v16 + 2), 8 * v16[2] * (uint64_t)v16[1]);
  if (!v85)
    goto LABEL_176;
  v86 = v85;
  do
  {
    v87 = (_QWORD *)v86[4];
    v86[5] = 0;
    v86[6] = v87;
    v86 = v87;
  }
  while (v87);
  v88 = (unsigned int *)v85;
  do
  {
    v91 = (unsigned int *)*((_QWORD *)v88 + 5);
    v90 = (unsigned int **)(v88 + 10);
    v89 = v91;
    v93 = v90 - 1;
    v92 = (uint64_t)*(v90 - 1);
    *v90 = 0;
    *(v90 - 1) = 0;
    sub_229081830((uint64_t)v16, v90[2]);
    v94 = v90[2];
    v95 = *v94;
    if ((int)v95 < 1)
    {
      v96 = 0;
      v97 = 0;
      v101 = 0x7FFFFFFF;
      v102 = 0x7FFFFFFF;
      if (!v92)
        goto LABEL_152;
    }
    else
    {
      v96 = 0;
      v97 = 0;
      v98 = 0;
      v99 = 0;
      v100 = (int *)(*((_QWORD *)v94 + 1) + 8);
      v101 = 0x7FFFFFFF;
      v102 = 0x7FFFFFFF;
      v103 = 0x7FFFFFFF;
      v104 = 0x7FFFFFFF;
      do
      {
        v105 = *(v100 - 2);
        v107 = *v100;
        v100 += 4;
        v106 = v107;
        if (v104 > v105)
          v101 = v105;
        if (v104 >= v105)
          v104 = v105;
        if (v99 < v105)
          v96 = v105;
        if (v99 <= v105)
          v99 = v105;
        if (v103 > v106)
          v102 = v106;
        if (v103 >= v106)
          v103 = v106;
        if (v98 < v106)
          v97 = v106;
        if (v98 <= v106)
          v98 = v106;
        --v95;
      }
      while (v95);
      if (!v92)
        goto LABEL_152;
    }
    v108 = v90 - 1;
    v109 = v90;
    while (1)
    {
      v111 = *(_QWORD *)(v92 + 32);
      *(_QWORD *)(v92 + 32) = 0;
      v112 = *(uint64_t **)(*(_QWORD *)(v92 + 56) + 8);
      v113 = v112[1];
      if (v113 <= v102)
        break;
      v114 = *v112;
      if ((v114 & 0x80000000) != 0
        || *v16 <= (int)v114
        || (v115 = v113 - 1, (v115 & 0x80000000) != 0)
        || v16[1] <= (int)v115
        || ((*(_QWORD *)(*((_QWORD *)v16 + 2) + 8 * v115 * v16[2] + 8 * (v114 / 64)) << v114) & 0x8000000000000000) == 0)
      {
        v110 = v108;
        v108 = (unsigned int **)(v92 + 32);
        *(_QWORD *)(v92 + 32) = *v110;
        *v110 = (unsigned int *)v92;
        v92 = v111;
        if (!v111)
          goto LABEL_152;
      }
      else
      {
        v116 = v109;
        v109 = (unsigned int **)(v92 + 32);
        *(_QWORD *)(v92 + 32) = *v116;
        *v116 = (unsigned int *)v92;
        v92 = v111;
        if (!v111)
          goto LABEL_152;
      }
    }
    *v108 = (unsigned int *)v92;
    *(_QWORD *)(v92 + 32) = v111;
LABEL_152:
    v117 = v101 + (v101 < 0 ? 0x3F : 0);
    v118 = v96 + 63;
    v36 = v96 < -63;
    v119 = v96 + 126;
    if (v36)
      v118 = v119;
    v120 = (v97 - v102);
    if (v97 > v102)
    {
      v121 = v117 >> 6;
      v122 = v118 >> 6;
      if (v117 >> 6 < v118 >> 6)
      {
        v123 = v16[2];
        v124 = 8 * (v122 + ~v121) + 8;
        v125 = (char *)(*((_QWORD *)v16 + 2) + 8 * (v121 + (int)v123 * (uint64_t)v102));
        v126 = 8 * v123;
        do
        {
          bzero(v125, v124);
          v125 += v126;
          --v120;
        }
        while (v120);
      }
    }
    v127 = *v93;
    if (*v93)
    {
      *((_QWORD *)v127 + 5) = v89;
      v89 = v127;
    }
    if (*v90)
    {
      *((_QWORD *)*v90 + 5) = v89;
      v89 = *v90;
    }
    v88 = v89;
  }
  while (v89);
  v128 = v154;
  if (v154)
  {
    v129 = v154;
    do
    {
      v130 = (void **)v129[6];
      v129[6] = v129[4];
      v129 = v130;
    }
    while (v130);
    v128[4] = 0;
    v154 = 0;
    v131 = (void **)&v154;
    do
    {
      v153 = (void **)v128[4];
      do
      {
        v128[4] = *v131;
        v132 = v128 + 4;
        *v131 = v128;
        v133 = (void **)v128[5];
        if (v133)
        {
          do
          {
            v133[4] = *v132;
            v131 = v133 + 4;
            *v132 = v133;
            v134 = (void **)v133[5];
            if (v134)
            {
              v135 = &v153;
              do
              {
                v136 = v135;
                v137 = *v135;
                v135 = (void ***)(*v135 + 4);
              }
              while (v137);
              v134[4] = 0;
              *v136 = v134;
            }
            v133 = (void **)v133[6];
            v132 = v131;
          }
          while (v133);
        }
        else
        {
          v131 = v128 + 4;
        }
        v128 = (void **)v128[6];
      }
      while (v128);
      v128 = v153;
    }
    while (v153);
  }
LABEL_176:
  free(*((void **)v16 + 2));
  free(v16);
  *v143 = v85;
  if (!v147 || !*(_QWORD *)v147)
    return 0;
  v138 = *(double *)(v147 + 24) + *(double *)(v147 + 16) * 0.0;
  (*(void (**)(_QWORD, double))v147)(*(_QWORD *)(v147 + 8), v138);
  result = 0;
  *(double *)(v147 + 48) = v138;
  return result;
}

uint64_t sub_229081830(uint64_t result, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  signed int v6;
  uint64_t v7;
  int v8;
  int v9;
  signed int v10;
  uint64_t v11;
  signed int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;

  v2 = *a2;
  if ((int)v2 >= 1)
  {
    v3 = 0;
    v4 = (_DWORD *)*((_QWORD *)a2 + 1);
    v5 = v4[4 * (v2 - 1) + 2];
    v6 = *v4 & 0xFFFFFFC0;
    do
    {
      v7 = v4[4 * v3 + 2];
      if ((_DWORD)v5 == (_DWORD)v7)
      {
        v7 = v5;
      }
      else
      {
        v8 = v4[4 * v3];
        if ((int)v5 >= (int)v7)
          v9 = v4[4 * v3 + 2];
        else
          v9 = v5;
        v10 = v8 & 0xFFFFFFC0;
        if ((int)(v8 & 0xFFFFFFC0) >= v6)
        {
          if (v10 > v6)
          {
            v13 = *(_QWORD *)(result + 16) + 8 * *(int *)(result + 8) * (uint64_t)v9;
            v14 = v6;
            do
            {
              *(_QWORD *)(v13 + 8 * (v14 >> 6)) = ~*(_QWORD *)(v13 + 8 * (v14 >> 6));
              v14 += 64;
            }
            while (v14 < v10);
          }
        }
        else
        {
          v11 = *(_QWORD *)(result + 16) + 8 * *(int *)(result + 8) * (uint64_t)v9;
          v12 = v8 & 0xFFFFFFC0;
          do
          {
            *(_QWORD *)(v11 + 8 * (v12 >> 6)) = ~*(_QWORD *)(v11 + 8 * (v12 >> 6));
            v12 += 64;
          }
          while (v12 < v6);
        }
        v15 = v8 & 0x3F;
        if (v15)
        {
          v16 = *(_QWORD *)(result + 16) + 8 * *(int *)(result + 8) * (uint64_t)v9;
          *(_QWORD *)(v16 + 8 * (v10 >> 6)) ^= -1 << -(char)v15;
        }
      }
      ++v3;
      v5 = v7;
    }
    while (v3 != v2);
  }
  return result;
}

uint64_t sub_229081948(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  int v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  int v15;
  BOOL v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;

  v3 = -2;
  v4 = 2;
  while (2)
  {
    v5 = 0;
    v6 = v4 + a3;
    v7 = v4 + a2;
    v8 = (a3 - v4);
    v9 = a2 - v4;
    v10 = v3;
    do
    {
      v11 = a2 + v10 + 1;
      if (v11 < 0
        || (v11 < *(_DWORD *)a1 ? (v12 = v6 < 1) : (v12 = 1),
            v12
         || v6 > *(_DWORD *)(a1 + 4)
         || ((*(_QWORD *)(*(_QWORD *)(a1 + 16)
                        + 8 * *(int *)(a1 + 8) * (unint64_t)(v6 - 1)
                        + 8 * (v11 >> 6)) << v11) & 0x8000000000000000) == 0))
      {
        v13 = -1;
        if (v7 < 1)
          goto LABEL_18;
      }
      else
      {
        v13 = 1;
        if (v7 < 1)
          goto LABEL_18;
      }
      v14 = (a3 + v10);
      v15 = v14 + 1;
      v16 = v7 > *(_DWORD *)a1 || v15 < 1;
      if (v16
        || v15 > *(_DWORD *)(a1 + 4)
        || (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * *(int *)(a1 + 8) * v14 + 8 * ((v7 - 1) >> 6)) & (0x8000000000000000 >> (v4 + a2 - 1))) == 0)
      {
LABEL_18:
        v17 = -1;
        if (v11 < 1)
          goto LABEL_28;
        goto LABEL_19;
      }
      v17 = 1;
      if (v11 < 1)
        goto LABEL_28;
LABEL_19:
      if (v11 > *(_DWORD *)a1
        || (v8 & 0x80000000) != 0
        || (int)v8 >= *(_DWORD *)(a1 + 4)
        || ((*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * *(int *)(a1 + 8) * v8 + 8 * ((a2 + v10) >> 6)) << (a2 + v10)) & 0x8000000000000000) == 0)
      {
LABEL_28:
        v18 = -1;
        if ((v9 & 0x80000000) != 0)
          goto LABEL_34;
        goto LABEL_29;
      }
      v18 = 1;
      if ((v9 & 0x80000000) != 0)
        goto LABEL_34;
LABEL_29:
      if ((signed int)v9 < *(_DWORD *)a1)
      {
        v19 = (a3 + v10 + 1);
        if (a3 + v10 + 1 >= 0
          && (int)v19 < *(_DWORD *)(a1 + 4)
          && (*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8 * *(int *)(a1 + 8) * v19 + 8 * (v9 >> 6)) & (0x8000000000000000 >> (a2 - v4))) != 0)
        {
          v20 = 1;
          goto LABEL_35;
        }
      }
LABEL_34:
      v20 = -1;
LABEL_35:
      v5 += v13 + v17 + v18 + v20;
      v21 = (v10 + 2);
      ++v10;
    }
    while (v4 != v21);
    if (v5 <= 0)
    {
      if (v5)
        return 0;
      ++v4;
      --v3;
      if (v4 == 5)
        return 0;
      continue;
    }
    return 1;
  }
}

uint64_t sub_229081B58(uint64_t a1, uint64_t a2, double *a3)
{
  double *v3;
  uint64_t v4;
  void (*v5)(_QWORD, double);
  double v6;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  int *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int *v16;
  int v17;
  int v18;
  int *v19;
  double *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  int v27;
  int *v28;
  uint64_t v29;
  int v30;
  double *v31;
  char *v32;
  char *v33;
  int v34;
  uint64_t v35;
  _QWORD *v36;
  int v37;
  uint64_t v38;
  _DWORD *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  BOOL v58;
  int v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  BOOL v67;
  BOOL v68;
  BOOL v69;
  int v70;
  int v71;
  int v72;
  int v73;
  uint64_t *v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  unsigned int v80;
  unsigned int v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  _BOOL4 v91;
  _BOOL4 v93;
  int v94;
  uint64_t v95;
  int v96;
  int v98;
  int v99;
  unsigned int *v101;
  size_t v102;
  _QWORD *v103;
  _DWORD *v104;
  _DWORD *v105;
  _DWORD *v106;
  _DWORD *v107;
  _DWORD *v108;
  _DWORD *v109;
  uint64_t v110;
  int v111;
  int v112;
  uint64_t v113;
  size_t v114;
  uint64_t v115;
  uint64_t v116;
  int v117;
  int v118;
  unint64_t v119;
  int v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  int v125;
  uint64_t *v126;
  uint64_t v127;
  float64x2_t *v128;
  double v129;
  double v130;
  int v131;
  double *v132;
  uint64_t *v133;
  double v134;
  uint64_t v135;
  double v136;
  double v138;
  int v139;
  int v140;
  float64x2_t *v141;
  float64x2_t *v142;
  double v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t v147;
  double v150;
  double v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  int v159;
  uint64_t v160;
  char *v161;
  char *v162;
  uint64_t v163;
  int64_t v164;
  uint64_t v165;
  int v166;
  uint64_t v167;
  uint64_t v168;
  float64x2_t *v169;
  uint64_t v170;
  int64_t v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  char *v181;
  uint64_t v182;
  uint64_t v183;
  float64x2_t *v184;
  float64x2_t *v185;
  float64x2_t *v186;
  float64_t v187;
  float64_t v188;
  int v189;
  float64_t v190;
  float64x2_t v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  char *v201;
  double *v202;
  double *v203;
  uint64_t v204;
  double v205;
  double v206;
  double v207;
  double v208;
  double v209;
  float64x2_t v210;
  float64x2_t v211;
  double v212;
  double v213;
  double v214;
  uint64_t v215;
  uint64_t v216;
  double v217;
  _BOOL4 v218;
  _BOOL4 v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  double v243;
  double v245;
  double v247;
  double v248;
  BOOL v249;
  double v250;
  double v251;
  BOOL v252;
  double v253;
  double v255;
  double *v256;
  _QWORD *v257;
  uint64_t v258;
  uint64_t v259;
  int v260;
  double *v261;
  double *v262;
  double v263;
  double v264;
  double v265;
  double v266;
  double v267;
  double v268;
  double v269;
  double v270;
  double v271;
  double v272;
  double v273;
  double v274;
  double v275;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  double v290;
  uint64_t *v291;
  double v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  int32x4_t v298;
  __int128 v299;
  unint64_t v300;
  unint64_t v301;
  double v302;
  uint64_t v303;
  uint64_t v304;
  double v305;
  uint64_t v306;
  uint64_t v307;
  unint64_t v308;
  int v309;
  int v310;
  uint64_t v311;
  float64x2_t *v312;
  uint64_t v313;
  float64x2_t *v314;
  double v315;
  double v316;
  double v317;
  double v318;
  double *v319;
  double v320;
  double v321;
  double v322;
  double v323;
  double v324;
  double v325;
  double v326;
  double v327;
  double v328;
  double v329;
  double v330;
  float64x2_t *v331;
  float64x2_t v332;
  float64x2_t v333;
  uint64_t v334;
  uint64_t v335;
  size_t v336;
  _DWORD *v337;
  _DWORD *v338;
  char *v339;
  _DWORD *v340;
  _QWORD *v341;
  _DWORD *v342;
  double *v343;
  double *v344;
  double v345;
  void (*v346)(_QWORD, double);
  int v347;
  double *v348;
  double *v349;
  double *v350;
  uint64_t v351;
  uint64_t v352;
  int v353;
  double *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  BOOL v358;
  float64x2_t v359;
  uint64_t v360;
  unsigned int v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  int v365;
  uint64_t v366;
  _OWORD *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  int v381;
  uint64_t v382;
  double v383;
  int v384;
  uint64_t v385;
  uint64_t v386;
  double *v387;
  uint64_t v388;
  int v389;
  double v390;
  int v391;
  uint64_t v392;
  uint64_t v393;
  _QWORD *v394;
  double *v395;
  double v396;
  double v397;
  double v398;
  uint64_t v399;
  int v400;
  double v401;
  uint64_t v402;
  double *v403;
  uint64_t v404;
  double v405;
  unsigned int v406;
  unint64_t v407;
  double v408;
  uint64_t v409;
  uint64_t v410;
  double *v411;
  unint64_t v412;
  uint64_t v413;
  uint64_t v414;
  int v415;
  int v416;
  double *v417;
  double *v418;
  double *v419;
  double v420;
  double v421;
  double v422;
  double v423;
  double v424;
  int v425;
  int v426;
  int v427;
  int v428;
  int v429;
  double *v430;
  double *v431;
  double v432;
  double v433;
  double v434;
  double v435;
  double v436;
  int v437;
  int v438;
  int v439;
  unint64_t v440;
  double v441;
  uint64_t v442;
  double v443;
  uint64_t v444;
  double v445;
  double v446;
  double *v447;
  double v448;
  double v449;
  double *v450;
  double v451;
  double v452;
  uint64_t v453;
  double v454;
  double v455;
  double v456;
  double v457;
  double v458;
  double v459;
  double v460;
  double v461;
  double v462;
  double v463;
  double v464;
  double v465;
  double v466;
  double v467;
  double v468;
  double v469;
  double v470;
  double v471;
  int v472;
  int v473;
  int v474;
  int v475;
  uint64_t v476;
  uint64_t v477;
  double v478;
  double v479;
  double v480;
  double v481;
  double v482;
  double v483;
  double v484;
  double v485;
  double v486;
  double v487;
  double v488;
  double v489;
  double v490;
  double v491;
  double v494;
  double v495;
  double v496;
  double v497;
  double v498;
  double v499;
  int v500;
  int v501;
  double v502;
  int v503;
  int v504;
  int v505;
  double *v506;
  double *v507;
  double v508;
  double v509;
  double v510;
  double v511;
  double v512;
  double v513;
  double v514;
  double v515;
  double v516;
  double v517;
  double v518;
  double v519;
  double v520;
  double v521;
  double v524;
  double v525;
  double v526;
  double v527;
  double v528;
  double v529;
  double v530;
  double v531;
  double v532;
  double v533;
  double v534;
  double v535;
  double v536;
  double v537;
  void *v538;
  void *v539;
  double *v540;
  double v541;
  uint64_t result;
  double v543;
  double v544;
  double v546;
  double *v548;
  double v549;
  uint64_t v550;
  char *v551;
  double v552;
  double v553;
  uint64_t v554;
  double v555;
  int v556;
  float64x2_t *v557;
  _QWORD *v558;
  int32x4_t v559;
  uint64_t v560;

  v3 = a3;
  v4 = a1;
  v560 = *MEMORY[0x24BDAC8D0];
  v5 = *(void (**)(_QWORD, double))a3;
  v6 = 0.0;
  if (*(_QWORD *)a3)
    _ZF = a1 == 0;
  else
    _ZF = 1;
  if (!_ZF)
  {
    v8 = a1;
    do
    {
      v6 = v6 + (double)**(int **)(v8 + 56);
      v8 = *(_QWORD *)(v8 + 32);
    }
    while (v8);
  }
  if (!a1)
  {
LABEL_572:
    if (!v5)
      return 0;
    v541 = v3[3] + v3[2] * 0.0;
    v5(*((_QWORD *)v3 + 1), v541);
    result = 0;
    v3[6] = v541;
    return result;
  }
  v9 = 4.0;
  v10 = -0.5;
  v11 = 1.0;
  v546 = 0.0;
LABEL_9:
  v12 = *(int **)(v4 + 56);
  v13 = *v12;
  v14 = (char *)malloc_type_calloc(v13 + 1, 0x28uLL, 0x10000400A747E1EuLL);
  *((_QWORD *)v12 + 4) = v14;
  if (!v14)
    return 1;
  v15 = v13;
  v16 = (int *)*((_QWORD *)v12 + 1);
  v17 = *v16;
  v12[6] = *v16;
  v18 = v16[2];
  v12[7] = v18;
  *((_QWORD *)v14 + 4) = 0;
  *(_OWORD *)v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  if ((int)v13 >= 1)
  {
    v19 = v16 + 2;
    v20 = (double *)(v14 + 72);
    v21 = 0.0;
    v22 = 0.0;
    v23 = 0.0;
    v24 = 0.0;
    v25 = 0.0;
    do
    {
      v26 = *(v19 - 2) - v17;
      v27 = *v19;
      v19 += 4;
      v25 = v25 + (double)v26;
      v24 = v24 + (double)(v27 - v18);
      v23 = v23 + (double)(v26 * v26);
      *(v20 - 4) = v25;
      *(v20 - 3) = v24;
      v22 = v22 + (double)((v27 - v18) * v26);
      *(v20 - 2) = v23;
      *(v20 - 1) = v22;
      v21 = v21 + (double)((v27 - v18) * (v27 - v18));
      *v20 = v21;
      v20 += 5;
      --v15;
    }
    while (v15);
  }
  v28 = *(int **)(v4 + 56);
  v29 = *((_QWORD *)v28 + 1);
  v30 = *v28;
  v31 = (double *)malloc_type_calloc(*v28, 4uLL, 0x100004052888210uLL);
  if (!v31)
  {
    v33 = 0;
    goto LABEL_570;
  }
  v32 = (char *)malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
  v33 = v32;
  if (!v32)
    goto LABEL_570;
  v550 = v4;
  if (v30 < 1)
  {
    v94 = v30 - 1;
    v39 = malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
    *((_QWORD *)v28 + 2) = v39;
    if (v39)
    {
      v85 = v94;
      v95 = v94;
      v87 = *(_DWORD *)((char *)v31 + v95 * 4);
      v39[v95] = v87;
      goto LABEL_133;
    }
    goto LABEL_570;
  }
  v34 = 0;
  v35 = (v30 - 1);
  v36 = (_QWORD *)(v29 + 16 * v35 + 8);
  v37 = v30;
  v38 = v35;
  do
  {
    if (*(v36 - 1) != *(_QWORD *)(v29 + 16 * v34) && *v36 != *(_QWORD *)(v29 + 16 * v34 + 8))
      v34 = v37;
    *(_DWORD *)&v32[4 * v38] = v34;
    --v37;
    v36 -= 2;
    v58 = v38-- <= 0;
  }
  while (!v58);
  v556 = v30 - 1;
  v39 = malloc_type_calloc(v30, 4uLL, 0x100004052888210uLL);
  *((_QWORD *)v28 + 2) = v39;
  if (!v39)
    goto LABEL_570;
  while (2)
  {
    v559 = 0uLL;
    if (v35 + 1 >= v30)
      v41 = (((int)v35 + 1) % v30);
    else
      v41 = (v35 + 1);
    v42 = *(_QWORD *)(v29 + 16 * v35);
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v46 = 0;
    v47 = *(_QWORD *)(v29 + 16 * v35 + 8);
    v48 = 3 * (*(_QWORD *)(v29 + 16 * v41) - v42) + *(_QWORD *)(v29 + 16 * v41 + 8) - v47;
    v49 = v48 + 3;
    v50 = v48 + 4;
    if (v49 >= 0)
      v50 = v49;
    ++*(__int32 *)((char *)v559.i32 + ((v50 << 31 >> 30) & 0xFFFFFFFFFFFFFFFCLL));
    v51 = *(_DWORD *)&v33[4 * v35];
    v52 = (uint64_t *)(v29 + 16 * (int)v35);
    v54 = *v52;
    v53 = v52[1];
    v40 = v35;
    do
    {
      while (1)
      {
        v55 = (uint64_t *)(v29 + 16 * v51);
        v57 = *v55;
        v56 = v55[1];
        v58 = *v55 <= v54;
        if (*v55 == v54)
          v59 = 3;
        else
          v59 = 0;
        if (!v58)
          v59 = 6;
        if (v56 == v53)
          v60 = 0;
        else
          v60 = -1;
        if (v56 > v53)
          v60 = 1;
        v61 = ((unint64_t)(v60 + v59 + (((v60 + v59) & 0x80u) >> 7)) >> 1);
        ++v559.i32[v61];
        if ((vmaxv_u16((uint16x4_t)vmovn_s32(vceqzq_s32(v559))) & 1) == 0)
          goto LABEL_24;
        v62 = v51;
        v63 = v57 - v42;
        v64 = v56 - v47;
        if (((_DWORD)v56 - (_DWORD)v47) * v46 - ((_DWORD)v57 - (_DWORD)v42) * v45 < 0
          || (int)v64 * v44 - (int)v63 * v43 > 0)
        {
          LODWORD(v63) = v54 - v42;
          LODWORD(v64) = v53 - v47;
          v62 = v40;
          goto LABEL_81;
        }
        if (v63 >= 0)
          v65 = v57 - v42;
        else
          v65 = v42 - v57;
        if (v64 >= 0)
          v66 = v56 - v47;
        else
          v66 = v47 - v56;
        if (v65 > 1 || v66 >= 2)
        {
          v67 = v63 > 0;
          v68 = v63 < 0;
          if (v64 < 0)
            v67 = 1;
          v69 = v57 != v42;
          if (v64 < 0)
            v69 = 1;
          if (v56 != v47)
            v68 = 1;
          if (v64 >= 0 && v68)
            v70 = v63 + 1;
          else
            v70 = v63 - 1;
          if (v63 < 1 && v69)
            v71 = v64 + 1;
          else
            v71 = v64 - 1;
          if (((v71 * v46 - v70 * v45) & 0x80000000) == 0)
          {
            v45 = v71;
            v46 = v70;
          }
          if (v64 < 1 && v68)
            v72 = v63 + 1;
          else
            v72 = v63 - 1;
          if (v63 >= 0 && v67)
            v73 = v64 + 1;
          else
            v73 = v64 - 1;
          if (v73 * v44 - v72 * v43 < 1)
          {
            v43 = v73;
            v44 = v72;
          }
        }
        v51 = *(_DWORD *)&v33[4 * v62];
        if (v51 <= v62)
          break;
        v53 = v56;
        v54 = v57;
        v40 = v62;
        if (v35 >= v62)
          goto LABEL_32;
      }
      if (v35 >= v62)
        break;
LABEL_32:
      v53 = v56;
      v54 = v57;
      v40 = v62;
    }
    while (v35 >= v51);
    v74 = (uint64_t *)(v29 + 16 * v51);
    v53 = v56;
    v54 = v57;
    v57 = *v74;
    v56 = v74[1];
LABEL_81:
    if (v57 == v54)
      v75 = 0;
    else
      v75 = -1;
    if (v57 > v54)
      v75 = 1;
    if (v56 == v53)
      v76 = 0;
    else
      v76 = -1;
    if (v56 > v53)
      v76 = 1;
    v77 = v46 * v76 - v45 * v75;
    if ((v77 & 0x80000000) == 0)
    {
      v78 = 10000000;
      v79 = v44 * v76 - v75 * v43;
      if (v79 < 1)
        goto LABEL_93;
LABEL_99:
      v82 = v43 * v63 - v44 * v64;
      if ((v82 & 0x80000000) != 0)
      {
        v84 = ~v82 / v79;
        if (v78 >= (int)~v84)
          v78 = ~v84;
        v40 = v78 + v62;
        if (v78 + v62 < v30)
          goto LABEL_107;
      }
      else
      {
        v83 = v82 / v79;
        if (v78 >= v83)
          v78 = v83;
        v40 = v78 + v62;
        if (v78 + v62 < v30)
          goto LABEL_107;
      }
LABEL_23:
      v40 %= v30;
      goto LABEL_24;
    }
    v80 = v46 * v64 - v45 * v63;
    v81 = -v77;
    if ((v80 & 0x80000000) != 0)
    {
      v78 = ~(~v80 / v81);
      v79 = v44 * v76 - v75 * v43;
      if (v79 >= 1)
        goto LABEL_99;
    }
    else
    {
      v78 = v80 / v81;
      v79 = v44 * v76 - v75 * v43;
      if (v79 >= 1)
        goto LABEL_99;
    }
LABEL_93:
    v40 = v78 + v62;
    if (v78 + v62 >= v30)
      goto LABEL_23;
LABEL_107:
    if (v40 < 0)
      v40 = v30 + ~(~v40 % v30);
LABEL_24:
    *((_DWORD *)v31 + v35) = v40;
    v58 = v35-- <= 0;
    if (!v58)
      continue;
    break;
  }
  v85 = v556;
  v86 = v556;
  v87 = *(_DWORD *)((char *)v31 + v86 * 4);
  v39[v86] = v87;
  v88 = (v30 - 2);
  if (v30 < 2)
  {
    v4 = v550;
  }
  else
  {
    v4 = v550;
    do
    {
      v89 = *((int *)v31 + v88);
      v91 = (int)v89 < v87 || v88 < v89;
      v93 = (int)v89 < v87 && v88 < v89;
      if (v88 < v87)
        v91 = v93;
      if (v91)
        v87 = *((_DWORD *)v31 + v88);
      v39[v88] = v87;
      v58 = v88-- <= 0;
    }
    while (!v58);
  }
LABEL_133:
  v96 = -2 - v85;
  while (2)
  {
    v98 = v30 + ~(v96 % v30);
    if (v85 >= -1)
      v98 = v85 + 1;
    if (v85 + 1 >= v30)
      v98 = ((int)v85 + 1) % v30;
    v99 = v39[v85];
    if (v98 <= v99)
    {
      if (v98 > v87 || v87 >= v99)
        break;
      goto LABEL_139;
    }
    if (v98 <= v87 || v87 < v99)
    {
LABEL_139:
      v39[v85--] = v87;
      ++v96;
      continue;
    }
    break;
  }
  free(v31);
  free(v33);
  v101 = *(unsigned int **)(v4 + 56);
  v102 = *v101;
  if ((v102 & 0x80000000) != 0)
    return 1;
  v103 = malloc_type_calloc(v102 + 1, 8uLL, 0x100004000313F17uLL);
  if (v103)
  {
    v104 = malloc_type_calloc(v102 + 1, 4uLL, 0x100004052888210uLL);
    if (!v104)
      goto LABEL_559;
    v105 = malloc_type_calloc(v102, 4uLL, 0x100004052888210uLL);
    if (!v105)
      goto LABEL_560;
    v106 = malloc_type_calloc(v102 + 1, 4uLL, 0x100004052888210uLL);
    if (!v106)
      goto LABEL_561;
    v107 = malloc_type_calloc(v102 + 1, 4uLL, 0x100004052888210uLL);
    if (!v107)
      goto LABEL_562;
    v108 = malloc_type_calloc(v102 + 1, 4uLL, 0x100004052888210uLL);
    v109 = v108;
    if (!v108)
      goto LABEL_563;
    if ((_DWORD)v102)
    {
      v110 = *((_QWORD *)v101 + 2);
      v111 = *(_DWORD *)(v110 + 4 * (v102 - 1));
      v112 = v111 - 1;
      if (v111 > (int)v102)
      {
        v112 %= (int)v102;
        if (!v112)
          goto LABEL_159;
LABEL_163:
        if ((v112 & 0x80000000) == 0)
          goto LABEL_164;
        *v105 = v102;
        if ((_DWORD)v102 == 1)
          goto LABEL_167;
LABEL_198:
        v156 = 0;
        v157 = 0;
        while (2)
        {
          v159 = *(_DWORD *)(v110 + (v157 >> 30));
          v158 = v159 - 1;
          if (v159 <= (int)v102)
          {
            if (v159 <= 0)
            {
              v158 = v102 + ~(-v159 % (int)v102);
              v160 = v156 + 1;
              if (v156 + 1 == v158)
                goto LABEL_207;
            }
            else
            {
              v160 = v156 + 1;
              if (v156 + 1 == v158)
                goto LABEL_207;
            }
LABEL_199:
            if (v160 > v158)
              v158 = v102;
          }
          else
          {
            v158 %= (int)v102;
            v160 = v156 + 1;
            if (v156 + 1 != v158)
              goto LABEL_199;
LABEL_207:
            v158 = v156 + 2;
            if (v156 + 2 >= v102)
            {
              if (v102 - 2 == v156)
                v158 = 0;
              goto LABEL_199;
            }
          }
          v105[v156 + 1] = v158;
          v157 += 0x100000000;
          if (v102 - 1 == ++v156)
            goto LABEL_167;
          continue;
        }
      }
      if (v111 <= 0)
      {
        v112 = v102 + ~(-v111 % (int)v102);
        if (v112)
          goto LABEL_163;
      }
      else if (v111 != 1)
      {
        goto LABEL_163;
      }
LABEL_159:
      v112 = v102 > 1;
LABEL_164:
      *v105 = v112;
      if ((_DWORD)v102 != 1)
        goto LABEL_198;
LABEL_167:
      v115 = 0;
      LODWORD(v116) = 1;
      do
      {
        if ((int)v116 <= v105[v115])
        {
          v116 = (int)v116;
          do
          {
            v106[v116] = v115;
            v117 = v116 + 1;
            v58 = v116++ < (int)v105[v115];
          }
          while (v58);
          LODWORD(v116) = v117;
        }
        ++v115;
      }
      while (v115 != v102);
      v113 = 0;
      v118 = 0;
      do
      {
        v107[v113] = v118;
        v118 = v105[v118];
        ++v113;
      }
      while (v118 < (int)v102);
      v107[v113] = v102;
      if ((int)v113 >= 1)
      {
        v119 = v113;
        v120 = v102;
        do
        {
          v108[v119] = v120;
          v120 = v106[v120];
          v58 = v119-- > 1;
        }
        while (v58);
      }
      *v108 = 0;
      *v103 = 0;
      if ((_DWORD)v113)
      {
        v121 = 1;
        do
        {
          v122 = (int)v108[v121];
          v123 = v107[v121];
          if ((int)v122 <= v123)
          {
            do
            {
              while (1)
              {
                v124 = (int)v107[v121 - 1];
                v125 = v106[v122];
                if ((int)v124 >= v125)
                  break;
                *(double *)&v103[v122] = -1.0;
                v58 = v122++ < v123;
                if (!v58)
                  goto LABEL_180;
              }
              v126 = (uint64_t *)*((_QWORD *)v101 + 1);
              v127 = *((_QWORD *)v101 + 4);
              v128 = (float64x2_t *)(v127 + 40 * (v122 + 1));
              v129 = (double)*v126;
              v130 = (double)v126[1];
              v131 = v122 - v124 + 1;
              v132 = (double *)(v127 + 40 * (int)v124 + 32);
              v133 = &v126[2 * v124 + 1];
              v134 = -1.0;
              do
              {
                v135 = (int)*v101;
                if (v122 >= v135)
                {
                  v139 = v122 - v135;
                  v141 = (float64x2_t *)(v127 + 40 * ((int)v122 - (int)v135 + 1));
                  v142 = (float64x2_t *)(v127 + 40 * (int)v135);
                  *(_QWORD *)&v136 = *(_OWORD *)&vaddq_f64(vsubq_f64(v141[1], *(float64x2_t *)(v132 - 2)), v142[1]);
                  _Q3 = vaddq_f64(vsubq_f64(*v141, *(float64x2_t *)(v132 - 4)), *v142);
                  v138 = v141[2].f64[0] - *v132 + v142[2].f64[0];
                  v140 = v122 + 1 - v124;
                }
                else
                {
                  *(_QWORD *)&v136 = *(_OWORD *)&vsubq_f64(v128[1], *(float64x2_t *)(v132 - 2));
                  _Q3 = vsubq_f64(*v128, *(float64x2_t *)(v132 - 4));
                  v138 = v128[2].f64[0] - *v132;
                  v139 = v122;
                  v140 = v131;
                }
                v143 = (double)v140;
                v144 = *(v133 - 1);
                v145 = &v126[2 * v139];
                v147 = *v145;
                v146 = v145[1];
                _D7 = (double)(v147 + v144) * 0.5 - v129;
                _D16 = (double)(v146 + *v133) * 0.5 - v130;
                v150 = (v136 + -2.0 * _Q3.f64[0] * _D7) / v143 + _D7 * _D7;
                __asm
                {
                  FMLS            D4, D16, V3.D[0]
                  FMLS            D4, D7, V3.D[1]
                }
                v155 = *(double *)&v103[v124]
                     + sqrt(((double)(*v133 - v146) + (double)(*v133 - v146))* (double)(v147 - v144)* (_D4 / v143 + _D7 * _D16)+ (double)(*v133 - v146) * (double)(*v133 - v146) * v150+ (double)(v147 - v144)* (double)(v147 - v144)* ((v138 + vmuld_lane_f64(-2.0, _Q3, 1) * _D16) / v143 + _D16 * _D16));
                if (v134 < 0.0 || v155 < v134)
                {
                  v104[v122] = v124;
                  v125 = v106[v122];
                  v134 = v155;
                }
                v58 = v124-- <= v125;
                ++v131;
                v132 -= 5;
                v133 -= 2;
              }
              while (!v58);
              v123 = v107[v121];
              *(double *)&v103[v122] = v134;
              v58 = v122++ < v123;
            }
            while (v58);
          }
LABEL_180:
          ++v121;
        }
        while (v121 != (_DWORD)v113 + 1);
        v114 = v113;
      }
      else
      {
        v114 = 0;
      }
    }
    else
    {
      LODWORD(v113) = 0;
      v114 = 0;
      *v107 = 0;
      *v109 = 0;
      *v103 = 0;
    }
    v101[10] = v113;
    v161 = (char *)malloc_type_calloc(v114, 4uLL, 0x100004052888210uLL);
    *((_QWORD *)v101 + 6) = v161;
    if (!v161)
      goto LABEL_563;
    if ((_DWORD)v102)
    {
      v162 = &v161[4 * (int)v113 - 4];
      do
      {
        LODWORD(v102) = v104[v102];
        *(_DWORD *)v162 = v102;
        v162 -= 4;
      }
      while ((int)v102 > 0);
    }
    free(v103);
    free(v104);
    free(v105);
    free(v106);
    free(v107);
    free(v109);
    v163 = *(_QWORD *)(v550 + 56);
    v164 = *(int *)(v163 + 40);
    v165 = *(_QWORD *)(v163 + 48);
    v166 = *(_DWORD *)v163;
    v554 = *(_QWORD *)(v163 + 8);
    v167 = *(int *)(v163 + 24);
    v168 = *(int *)(v163 + 28);
    v169 = (float64x2_t *)malloc_type_calloc(v164, 0x10uLL, 0x1000040451B5BE8uLL);
    if (!v169)
    {
      v31 = 0;
      v33 = 0;
      goto LABEL_569;
    }
    v557 = v169;
    v31 = (double *)malloc_type_calloc(v164, 0x10uLL, 0x1000040451B5BE8uLL);
    if (v31)
    {
      v33 = (char *)malloc_type_calloc(v164, 0x48uLL, 0x1000040FF89C88EuLL);
      if (!v33 || sub_229080C50(v163 + 56, v164))
        goto LABEL_568;
      if ((int)v164 >= 1)
      {
        v170 = 0;
        while (1)
        {
          v171 = v170 + 1;
          if (v170 + 1 == v164)
            v172 = 0;
          else
            v172 = v170 + 1;
          if (v171 < v164)
            v172 = v170 + 1;
          v173 = *(_DWORD *)(v165 + 4 * v172);
          v174 = *(_DWORD *)(v165 + 4 * v170);
          v175 = v173 - v174;
          v176 = v166 + ~(~v175 % v166);
          if (v175 >= 0)
            v176 = v175;
          if (v175 >= v166)
            v177 = v175 % v166;
          else
            v177 = v176;
          v178 = v177 + v174;
          v179 = *(_DWORD *)v163;
          if (v178 >= *(_DWORD *)v163)
          {
            v180 = 0;
            do
            {
              v178 -= v179;
              ++v180;
            }
            while (v178 >= v179);
          }
          else
          {
            v180 = 0;
          }
          while (v174 >= v179)
          {
            v174 -= v179;
            --v180;
          }
          for (; v178 < 0; --v180)
            v178 += v179;
          if (v174 < 0)
          {
            do
            {
              ++v180;
              v174 += v179;
            }
            while (v174 < 0);
          }
          v181 = (char *)&v31[2 * v170];
          v182 = *(_QWORD *)(v163 + 32);
          v183 = v178 + 1;
          v184 = (float64x2_t *)(v182 + 40 * v183);
          v185 = (float64x2_t *)(v182 + 40 * v174);
          v186 = (float64x2_t *)(v182 + 40 * v179);
          v187 = v184[1].f64[0] - v185[1].f64[0] + (double)v180 * v186[1].f64[0];
          v188 = v184[1].f64[1] - v185[1].f64[1] + (double)v180 * v186[1].f64[1];
          v189 = v183 - v174 + v180 * v179;
          v190 = v184[2].f64[0] - v185[2].f64[0] + (double)v180 * v186[2].f64[0];
          v191 = vmlaq_n_f64(vsubq_f64(*v184, *v185), *v186, (double)v180);
          v557[v170] = vdivq_f64(v191, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v189), 0));
          v192 = (v187 - vmulq_f64(v191, v191).f64[0] / (double)v189) / (double)v189;
          v193 = (v188 - vmuld_lane_f64(v191.f64[0], v191, 1) / (double)v189) / (double)v189;
          v194 = (v190 - vmuld_lane_f64(v191.f64[1], v191, 1) / (double)v189) / (double)v189;
          v195 = (v192 + v194 + sqrt(v193 * (v193 * v9) + (v192 - v194) * (v192 - v194))) * 0.5;
          v196 = v193 * v193;
          if (vabdd_f64(v192, v195) >= vabdd_f64(v194, v195))
          {
            v200 = v192 - v195;
            v198 = sqrt(v196 + v200 * v200);
            if (v198 != 0.0)
            {
              *(double *)v181 = -v193 / v198;
              v199 = v200 / v198;
              goto LABEL_251;
            }
          }
          else
          {
            v197 = v194 - v195;
            v198 = sqrt(v196 + v197 * v197);
            if (v198 != 0.0)
            {
              *(double *)v181 = -v197 / v198;
              v199 = v193 / v198;
LABEL_251:
              v31[2 * v170 + 1] = v199;
            }
          }
          if (v198 == 0.0)
          {
            *(_QWORD *)v181 = 0;
            *((_QWORD *)v181 + 1) = 0;
          }
          ++v170;
          if (v171 == v164)
          {
            v201 = v33 + 32;
            v202 = v31 + 1;
            v203 = &v557->f64[1];
            v204 = v164;
            do
            {
              while (1)
              {
                v212 = *(v202 - 1);
                v213 = *v202;
                v214 = v213 * v213 + v212 * v212;
                if (v214 == 0.0)
                  break;
                v205 = -v212;
                v206 = v212 * *v203 - v213 * *(v203 - 1);
                v207 = -(v212 * v213) / v214;
                *((double *)v201 - 4) = v213 * v213 / v214;
                *((double *)v201 - 3) = v207;
                v208 = v213 * v206 / v214;
                *((double *)v201 - 2) = v208;
                *((double *)v201 - 1) = v207;
                v209 = v212 * v212 / v214;
                *((double *)v201 + 2) = v208;
                v210 = (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v206, 0);
                v210.f64[0] = v205;
                v211 = vdivq_f64(vmulq_n_f64(v210, v206), (float64x2_t)vdupq_lane_s64(*(uint64_t *)&v214, 0));
                *(double *)v201 = v209;
                *((_QWORD *)v201 + 1) = *(_QWORD *)&v211.f64[0];
                *(float64x2_t *)(v201 + 24) = v211;
                v201 += 72;
                v202 += 2;
                v203 += 2;
                if (!--v204)
                  goto LABEL_258;
              }
              *((_QWORD *)v201 + 4) = 0;
              *(_OWORD *)v201 = 0uLL;
              *((_OWORD *)v201 + 1) = 0uLL;
              *((_OWORD *)v201 - 2) = 0uLL;
              *((_OWORD *)v201 - 1) = 0uLL;
              v201 += 72;
              v202 += 2;
              v203 += 2;
              --v204;
            }
            while (v204);
LABEL_258:
            v215 = 0;
            v216 = *(_QWORD *)(v163 + 88);
LABEL_300:
            v257 = (_QWORD *)(v554 + 16 * *(int *)(v165 + 4 * v215));
            v258 = *v257 - v167;
            v259 = v257[1] - v168;
            if (v215)
              v260 = v215;
            else
              v260 = v164;
            v261 = (double *)&v33[72 * v260 - 72];
            v262 = (double *)&v33[72 * v215];
            v263 = *v261 + *v262;
            v264 = v261[1] + v262[1];
            v265 = v261[2] + v262[2];
            v266 = v261[3] + v262[3];
            v267 = v261[4] + v262[4];
            v268 = v261[5] + v262[5];
            v269 = v261[6] + v262[6];
            v270 = v261[7] + v262[7];
            v271 = (double)v258;
            v272 = v261[8] + v262[8];
            v273 = (double)v259;
            v274 = v263 * v267 - v264 * v266;
            if (v274 == 0.0)
            {
              v279 = -v264;
              do
              {
                v280 = v263;
                if (v263 <= v267)
                {
                  if (v267 == 0.0)
                  {
                    v279 = 1.0;
                    v280 = 0.0;
                  }
                  else
                  {
                    v279 = -v267;
                    v280 = v266;
                  }
                }
                v281 = v280 * v280 + v279 * v279;
                v282 = -(v279 * v271) - v280 * v273;
                v263 = v263 + v279 * v279 / v281;
                v283 = v280 * v279 / v281;
                v264 = v264 + v283;
                v284 = v279 * v282 / v281;
                v265 = v265 + v284;
                v266 = v266 + v283;
                v267 = v267 + v280 * v280 / v281;
                v285 = v280 * v282 / v281;
                v268 = v268 + v285;
                v269 = v269 + v284;
                v270 = v270 + v285;
                v272 = v272 + v282 * v282 / v281;
                v279 = -v264;
                v274 = v263 * v267 - v264 * v266;
              }
              while (v274 == 0.0);
            }
            v255 = (v264 * v268 - v265 * v267) / v274;
            v253 = (v265 * v266 - v268 * v263) / v274;
            v275 = vabdd_f64(v253, v273);
            if (vabdd_f64(v255, v271) <= 0.5 && v275 <= 0.5)
            {
LABEL_299:
              v256 = (double *)(v216 + 16 * v215);
              *v256 = v255 + (double)(int)v167;
              v256[1] = v253 + (double)(int)v168;
              if (++v215 == v164)
                break;
              goto LABEL_300;
            }
            v220 = v272
                 + v268 * v273
                 + v263 * v271 * v271
                 + 0.0
                 + v264 * v271 * v273
                 + v265 * v271
                 + v266 * v273 * v271
                 + v267 * v273 * v273
                 + v269 * v271
                 + v270 * v273;
            if (v263 == 0.0)
            {
              v217 = (double)v258;
              v224 = (double)v259;
              v225 = v271 + v10;
              if (v267 != 0.0)
                goto LABEL_311;
LABEL_269:
              v226 = v225 * v263 * v225 + 0.0;
              v227 = v225 * v264;
              v228 = v225 * v265;
              v229 = v225 + v11;
              v230 = (v225 + v11) * v263 * (v225 + v11) + 0.0;
              v231 = (v225 + v11) * v264;
              v232 = (v225 + v11) * v265;
            }
            else
            {
              v217 = -(v265 + v264 * (v273 + v10)) / v263;
              v218 = vabdd_f64(v217, v271) <= 0.5;
              v219 = v272
                   + (v273 + v10) * v268
                   + v265 * v217
                   + v263 * v217 * v217
                   + 0.0
                   + v264 * v217 * (v273 + v10)
                   + (v273 + v10) * v266 * v217
                   + (v273 + v10) * v267 * (v273 + v10)
                   + v269 * v217
                   + v270 * (v273 + v10) < v220;
              if (v218 && v219)
                v220 = v272
                     + (v273 + v10) * v268
                     + v265 * v217
                     + v263 * v217 * v217
                     + 0.0
                     + v264 * v217 * (v273 + v10)
                     + (v273 + v10) * v266 * v217
                     + (v273 + v10) * v267 * (v273 + v10)
                     + v269 * v217
                     + v270 * (v273 + v10);
              else
                v217 = v271;
              if (v218 && v219)
                v221 = v273 + v10;
              else
                v221 = v273;
              v222 = v273 + v10 + v11;
              v223 = -(v265 + v264 * v222) / v263;
              if (vabdd_f64(v223, v271) <= 0.5
                && v272
                 + v222 * v268
                 + v265 * v223
                 + v263 * v223 * v223
                 + 0.0
                 + v264 * v223 * v222
                 + v222 * v266 * v223
                 + v222 * v267 * v222
                 + v269 * v223
                 + v270 * v222 < v220)
              {
                v220 = v272
                     + v222 * v268
                     + v265 * v223
                     + v263 * v223 * v223
                     + 0.0
                     + v264 * v223 * v222
                     + v222 * v266 * v223
                     + v222 * v267 * v222
                     + v269 * v223
                     + v270 * v222;
                v217 = -(v265 + v264 * v222) / v263;
                v224 = v273 + v10 + v11;
              }
              else
              {
                v224 = v221;
              }
              v225 = v271 + v10;
              if (v267 == 0.0)
                goto LABEL_269;
LABEL_311:
              v277 = -(v268 + v266 * v225) / v267;
              v226 = v225 * v263 * v225 + 0.0;
              v227 = v225 * v264;
              v228 = v225 * v265;
              if (vabdd_f64(v277, v273) <= 0.5
                && v272
                 + v268 * v277
                 + v225 * v265
                 + v226
                 + v225 * v264 * v277
                 + v266 * v277 * v225
                 + v267 * v277 * v277
                 + v269 * v225
                 + v270 * v277 < v220)
              {
                v220 = v272
                     + v268 * v277
                     + v225 * v265
                     + v226
                     + v225 * v264 * v277
                     + v266 * v277 * v225
                     + v267 * v277 * v277
                     + v269 * v225
                     + v270 * v277;
                v217 = v225;
                v224 = -(v268 + v266 * v225) / v267;
              }
              v229 = v225 + v11;
              v278 = -(v268 + v266 * (v225 + v11)) / v267;
              v230 = (v225 + v11) * v263 * (v225 + v11) + 0.0;
              v231 = (v225 + v11) * v264;
              v232 = (v225 + v11) * v265;
              if (vabdd_f64(v278, v273) <= 0.5
                && v272
                 + v268 * v278
                 + v232
                 + v230
                 + v231 * v278
                 + v266 * v278 * (v225 + v11)
                 + v267 * v278 * v278
                 + v269 * (v225 + v11)
                 + v270 * v278 < v220)
              {
                v220 = v272
                     + v268 * v278
                     + v232
                     + v230
                     + v231 * v278
                     + v266 * v278 * (v225 + v11)
                     + v267 * v278 * v278
                     + v269 * (v225 + v11)
                     + v270 * v278;
                v217 = v225 + v11;
                v224 = -(v268 + v266 * (v225 + v11)) / v267;
              }
            }
            v233 = v273 + v10;
            v234 = v233 + v11;
            v235 = v233 * v266;
            v236 = v233 * v267;
            v237 = v233 * v268;
            v238 = v272
                 + v233 * v268
                 + v228
                 + v226
                 + v227 * v233
                 + v233 * v266 * v225
                 + v233 * v267 * v233
                 + v269 * v225
                 + v270 * v233;
            if (v238 >= v220)
              v239 = v220;
            else
              v239 = v272
                   + v233 * v268
                   + v228
                   + v226
                   + v227 * v233
                   + v233 * v266 * v225
                   + v233 * v267 * v233
                   + v269 * v225
                   + v270 * v233;
            if (v238 < v220)
              v224 = v233;
            v240 = v234 * v266;
            v241 = v234 * v267;
            v242 = v234 * v268;
            v243 = v272 + v242 + v228 + v226 + v227 * v234 + v240 * v225 + v241 * v234 + v269 * v225 + v270 * v234;
            _NF = v243 < v239;
            if (v243 >= v239)
              v243 = v239;
            v11 = 1.0;
            if (_NF)
              v245 = v234;
            else
              v245 = v224;
            if (!_NF && v238 >= v220)
              v225 = v217;
            v247 = v237 + v232 + v230 + v231 * v233 + v235 * v229 + v236 * v233 + v269 * v229 + v270 * v233;
            v248 = v272 + v247;
            v249 = v272 + v247 < v243;
            if (v272 + v247 >= v243)
              v250 = v243;
            else
              v250 = v272 + v247;
            if (!v249)
              v233 = v245;
            v251 = v272 + v242 + v232 + v230 + v231 * v234 + v240 * v229 + v241 * v234 + v269 * v229 + v270 * v234;
            v252 = v251 < v250;
            if (v251 >= v250)
              v253 = v233;
            else
              v253 = v234;
            if (v252 || v248 < v243)
              v255 = v229;
            else
              v255 = v225;
            goto LABEL_299;
          }
        }
      }
      free(v557);
      free(v31);
      free(v33);
      v286 = v550;
      v287 = *(_QWORD *)(v550 + 56);
      if (*(_DWORD *)(v550 + 4) == 45)
      {
        v288 = *(unsigned int *)(v287 + 56);
        v3 = a3;
        v289 = a2;
        v290 = -1.0;
        v291 = &qword_229093000;
        v292 = 0.75;
        if ((int)v288 >= 2)
        {
          v293 = 0;
          v294 = 0;
          v295 = v288 - 2;
          v296 = 16 * v288 - 16;
          do
          {
            v297 = *(_QWORD *)(v287 + 88);
            v299 = *(_OWORD *)(v297 + v296);
            v559 = *(int32x4_t *)(v297 + v293);
            v298 = v559;
            *(_OWORD *)(v297 + v293) = v299;
            *(int32x4_t *)(*(_QWORD *)(v287 + 88) + v296) = v298;
            ++v294;
            v293 += 16;
            v296 -= 16;
            v58 = v294 < v295--;
          }
          while (v58);
          v287 = *(_QWORD *)(v550 + 56);
        }
      }
      else
      {
        v3 = a3;
        v289 = a2;
        v290 = -1.0;
        v291 = &qword_229093000;
        v292 = 0.75;
      }
      v300 = *(unsigned int *)(v287 + 56);
      if ((int)v300 >= 1)
      {
        v301 = 0;
        v302 = *(double *)(v289 + 8);
        v303 = 8;
        do
        {
          v308 = v301 + 1;
          if (v300 - 1 == v301)
            v309 = 0;
          else
            v309 = v301 + 1;
          if (v308 < v300)
            v309 = v301 + 1;
          v310 = v301 + 2;
          if (v310 >= (int)v300)
            v310 %= (int)v300;
          v311 = *(_QWORD *)(v287 + 88);
          v312 = (float64x2_t *)(v311 + 16 * v310);
          v313 = v309;
          v314 = (float64x2_t *)(v311 + 16 * v309);
          v316 = v312->f64[0];
          v315 = v312->f64[1];
          v318 = v314->f64[0];
          v317 = v314->f64[1];
          v319 = (double *)(v311 + v303);
          v320 = *(v319 - 1);
          v321 = *v319;
          v322 = v312->f64[0] - v320;
          if (v322 >= 0.0)
            v323 = 0.0;
          else
            v323 = v290;
          v324 = v315 - v321;
          if (v322 > 0.0)
            v323 = v11;
          if (v324 >= 0.0)
            v325 = 0.0;
          else
            v325 = v11;
          if (v324 > 0.0)
            v325 = v290;
          v326 = v323 * v322 - v324 * v325;
          if (v326 == 0.0)
          {
            *(_QWORD *)(*(_QWORD *)(v287 + 104) + 8 * v313) = 0x3FF5555555555555;
            v329 = 1.33333333;
            if (v302 > 1.33333333)
              goto LABEL_357;
          }
          else
          {
            v327 = fabs(((v318 - v320) * v324 - v322 * (v317 - v321)) / v326);
            v328 = 0.0;
            if (v327 > v11)
              v328 = v11 - v11 / v327;
            v329 = v328 / v292;
            *(double *)(*(_QWORD *)(v287 + 104) + 8 * v313) = v328 / v292;
            if (v328 / v292 < v302)
            {
              v305 = *((double *)v291 + 296);
              if (v329 >= v305)
              {
                v305 = v329;
                if (v329 > v11)
LABEL_357:
                  v305 = 1.0;
              }
              v330 = v305 * 0.5 + 0.5;
              v304 = *(_QWORD *)(v287 + 72);
              v331 = (float64x2_t *)(v304 + 48 * (int)v313);
              v332 = vmlaq_n_f64(*(float64x2_t *)(v319 - 1), vsubq_f64(*v314, *(float64x2_t *)(v319 - 1)), v330);
              v333 = vmlaq_n_f64(*v312, vsubq_f64(*v314, *v312), v330);
              *(_DWORD *)(*(_QWORD *)(v287 + 64) + 4 * v313) = 1;
              *v331 = v332;
              v331[1] = v333;
              goto LABEL_331;
            }
          }
          *(_DWORD *)(*(_QWORD *)(v287 + 64) + 4 * v313) = 2;
          *(float64x2_t *)(*(_QWORD *)(v287 + 72) + 48 * (int)v313 + 16) = *v314;
          v304 = *(_QWORD *)(v287 + 72);
          v305 = v329;
LABEL_331:
          v306 = v304 + 48 * (int)v313;
          *(double *)(v306 + 32) = v316 + (v318 - v316) * 0.5;
          *(double *)(v306 + 40) = v315 + (v317 - v315) * 0.5;
          v307 = 8 * v313;
          *(double *)(*(_QWORD *)(v287 + 96) + v307) = v305;
          *(_QWORD *)(*(_QWORD *)(v287 + 112) + v307) = 0x3FE0000000000000;
          v303 += 16;
          v301 = v308;
        }
        while (v300 != v308);
      }
      *(_DWORD *)(v287 + 80) = 1;
      v334 = *(_QWORD *)(v550 + 56);
      if (!*(_DWORD *)(v289 + 16))
      {
        *(_QWORD *)(v334 + 184) = v334 + 56;
        sub_229080D9C(v334 + 56, v550 + 8);
        v346 = *(void (**)(_QWORD, double))v3;
        if (*(_QWORD *)v3)
          goto LABEL_411;
        goto LABEL_414;
      }
      v552 = *(double *)(v289 + 24);
      v335 = *(unsigned int *)(v334 + 56);
      v336 = (int)v335 + 1;
      v337 = malloc_type_calloc(v336, 4uLL, 0x100004052888210uLL);
      if (v337 && (v558 = malloc_type_calloc(v336, 8uLL, 0x100004000313F17uLL)) != 0)
      {
        v338 = malloc_type_calloc(v336, 4uLL, 0x100004052888210uLL);
        if (!v338)
          goto LABEL_565;
        v339 = (char *)malloc_type_calloc(v336, 0x40uLL, 0x1000040FA0F61DDuLL);
        if (!v339)
          goto LABEL_565;
        v551 = v339;
        v340 = malloc_type_calloc((int)v335, 4uLL, 0x100004052888210uLL);
        if (v340 && (v341 = malloc_type_calloc(v336, 8uLL, 0x100004000313F17uLL)) != 0)
        {
          v548 = (double *)v341;
          if ((int)v335 >= 1)
          {
            v342 = *(_DWORD **)(v334 + 64);
            if (*v342 == 1)
            {
              v343 = *(double **)(v334 + 88);
              v344 = &v343[2 * (v335 - 1)];
              v345 = (*v343 - *v344) * (v343[2 * (v335 > 1) + 1] - v344[1])
                   - (v343[2 * (v335 > 1)] - *v344) * (v343[1] - v344[1]);
              if (v345 <= 0.0)
              {
                if (v345 >= 0.0)
                  v384 = 0;
                else
                  v384 = -1;
                *v340 = v384;
                if ((_DWORD)v335 != 1)
                  goto LABEL_424;
              }
              else
              {
                *v340 = 1;
                if ((_DWORD)v335 == 1)
                  goto LABEL_438;
LABEL_424:
                v385 = 1;
                do
                {
                  while (v342[v385] != 1)
                  {
                    v340[v385++] = 0;
                    if (v385 == v335)
                      goto LABEL_438;
                  }
                  v386 = *(_QWORD *)(v334 + 88);
                  v388 = v385 + 1;
                  if (v385 + 1 == v335)
                    v389 = 0;
                  else
                    v389 = v385 + 1;
                  if (v388 < (int)v335)
                    v389 = v385 + 1;
                  v387 = (double *)(v386 + (((v385 << 32) - 0x100000000) >> 28));
                  v390 = (*(double *)(v386 + 16 * v385) - *v387) * (*(double *)(v386 + 16 * v389 + 8) - v387[1])
                       - (*(double *)(v386 + 16 * v389) - *v387) * (*(double *)(v386 + 16 * v385 + 8) - v387[1]);
                  if (v390 >= 0.0)
                    v391 = 0;
                  else
                    v391 = -1;
                  if (v390 > 0.0)
                    v391 = 1;
                  v340[v385++] = v391;
                }
                while (v388 != v335);
              }
            }
            else
            {
              *v340 = 0;
              if ((_DWORD)v335 != 1)
                goto LABEL_424;
            }
LABEL_438:
            v392 = 0;
            v393 = 0;
            *v341 = 0;
            v394 = v341 + 1;
            v395 = *(double **)(v334 + 88);
            v396 = *v395;
            v397 = v395[1];
            v398 = 0.0;
            do
            {
              v399 = v393 + 1;
              if (v335 - 1 == v393)
                v400 = 0;
              else
                v400 = v393 + 1;
              if (v399 < (int)v335)
                v400 = v393 + 1;
              if (v342[v400] == 1)
              {
                v401 = *(double *)(*(_QWORD *)(v334 + 96) + 8 * v400);
                v402 = *(_QWORD *)(v334 + 72);
                v403 = &v395[2 * v400];
                v404 = v402 + 48 * v400;
                v405 = *(double *)(v402 + v392 + 32);
                v398 = ((v405 - v396) * (*(double *)(v404 + 40) - v397)
                      - (*(double *)(v404 + 32) - v396) * (*(double *)(v402 + v392 + 40) - v397))
                     * 0.5
                     + v398
                     + v401
                     * 0.3
                     * (v9 - v401)
                     * ((*v403 - v405) * (*(double *)(v404 + 40) - *(double *)(v402 + v392 + 40))
                      - (*(double *)(v404 + 32) - v405) * (v403[1] - *(double *)(v402 + v392 + 40)))
                     * 0.5;
              }
              *(double *)&v394[v393] = v398;
              v392 += 48;
              ++v393;
            }
            while (v335 != v399);
            v406 = -1;
            *v337 = -1;
            *v558 = 0;
            *v338 = 0;
            v407 = 1;
            v408 = -4.0;
            while (1)
            {
              v409 = v407;
              v337[v409] = v407 - 1;
              v558[v407] = v558[v407 - 1];
              v338[v409] = v338[v407 - 1] + 1;
              if (v407 >= 2)
              {
                v410 = v406;
                v411 = (double *)&v551[64 * v407];
                LODWORD(v412) = v407 == v335 ? 0 : v407;
                v412 = (uint64_t)v407 >= (int)v335 ? v412 : v407;
                while (2)
                {
                  if (v410 != v412)
                  {
                    v413 = *(int *)(v334 + 56);
                    v414 = v410 + 1;
                    v415 = v410 + 1;
                    if (v410 + 1 >= v413)
                      v415 = (int)v414 % (int)v413;
                    v416 = v340[v415];
                    if (v416)
                    {
                      v417 = *(double **)(v334 + 88);
                      v418 = &v417[2 * v410];
                      v419 = &v417[2 * v415];
                      v420 = v418[1];
                      v421 = v419[1];
                      v422 = sqrt((v420 - v421) * (v420 - v421) + (*v418 - *v419) * (*v418 - *v419));
                      v423 = *v419 - *v418;
                      v424 = v421 - v420;
                      while (v415 != (_DWORD)v412)
                      {
                        v425 = v415 + 1;
                        v426 = v413 + ~((-2 - v415) % (int)v413);
                        if (v415 > -2)
                          v426 = v415 + 1;
                        if (v425 >= (int)v413)
                          v427 = v425 % (int)v413;
                        else
                          v427 = v426;
                        v428 = v415 + 2;
                        if (v415 <= -3)
                          v429 = v413 + ~((-3 - v415) % (int)v413);
                        else
                          v429 = v415 + 2;
                        if (v428 >= (int)v413)
                          v429 = v428 % (int)v413;
                        if (v340[v427] == v416)
                        {
                          v430 = &v417[2 * v427];
                          v431 = &v417[2 * v429];
                          v432 = v430[1];
                          v433 = *v431;
                          v434 = v431[1];
                          v435 = *v431 - *v430;
                          v436 = v423 * (v434 - v432) - v435 * v424;
                          if (v436 >= 0.0)
                            v437 = 0;
                          else
                            v437 = -1;
                          if (v436 > 0.0)
                            v437 = 1;
                          if (v437 == v416)
                          {
                            v415 = v427;
                            if (v424 * (v434 - v432) + v423 * v435 >= v422
                                                                     * sqrt((v432 - v434) * (v432 - v434)+ (*v430 - v433) * (*v430 - v433))* -0.999847695)continue;
                          }
                        }
                        goto LABEL_448;
                      }
                      v438 = (int)v413 <= (int)v410 ? (int)v410 % (int)v413 : v410;
                      v439 = v414 >= v413 ? (int)v414 % (int)v413 : v410 + 1;
                      if ((int)v413 <= (int)v412)
                      {
                        v440 = (int)v412 % (int)v413;
                        v441 = -0.5;
                      }
                      else
                      {
                        v440 = v412;
                        v441 = -0.5;
                        if ((v412 & 0x80000000) != 0)
                          v440 = (int)v413 + ~(~(_DWORD)v412 % (int)v413);
                      }
                      v442 = *(_QWORD *)(v334 + 72);
                      v443 = v548[(int)v412]
                           - v548[v410]
                           + ((*(double *)(v442 + 48 * v410 + 32) - *v417)
                            * (*(double *)(v442 + 48 * (int)v412 + 40) - v417[1])
                            - (*(double *)(v442 + 48 * (int)v412 + 32) - *v417)
                            * (*(double *)(v442 + 48 * v410 + 40) - v417[1]))
                           * v441;
                      if ((int)v412 <= (int)v410)
                        v443 = v443 + v548[v413];
                      v444 = v442 + 48 * v438;
                      v445 = *(double *)(v444 + 32);
                      v446 = *(double *)(v444 + 40);
                      v447 = &v417[2 * v439];
                      v448 = *v447;
                      v449 = v447[1];
                      v450 = &v417[2 * v440];
                      v451 = *v450;
                      v452 = v450[1];
                      v453 = v442 + 48 * v440;
                      v454 = *(double *)(v453 + 32);
                      v455 = *(double *)(v453 + 40);
                      v456 = v449 - v446;
                      v457 = (v448 - v445) * (v452 - v446) - (v451 - v445) * (v449 - v446);
                      v458 = (v448 - v445) * (v455 - v446) - (v454 - v445) * v456;
                      if (v458 != v457)
                      {
                        v549 = ((v452 - v446) * -(v454 - v445) + (v451 - v445) * (v455 - v446))
                             / ((v452 - v446) * -(v454 - v445)
                              + (v451 - v445) * (v455 - v446)
                              - (v457
                               + (v452 - v446) * -(v454 - v445)
                               + (v451 - v445) * (v455 - v446)
                               - v458));
                        v459 = v458 * v549 * 0.5;
                        if (v459 != 0.0)
                        {
                          v460 = v458 / (v458 - v457);
                          v461 = 2.0 - sqrt(v443 / v459 / -0.3 + 4.0);
                          v462 = v445 + v549 * v461 * (v448 - v445);
                          v463 = v446 + v549 * v461 * v456;
                          v543 = v461;
                          v544 = v460;
                          v464 = v454 + v460 * v461 * (v451 - v454);
                          v465 = v455 + v460 * v461 * (v452 - v455);
                          if (v414 >= v413)
                            LODWORD(v414) = (int)v414 % (int)v413;
                          v553 = v463 - v446;
                          v555 = v462 - v445;
                          v466 = v464 - v462;
                          v467 = v465 - v463;
                          v468 = v454 - v464;
                          v469 = v455 - v465;
                          v470 = 0.0;
                          if ((_DWORD)v414 == (_DWORD)v412)
                          {
LABEL_498:
                            v471 = v470;
                            v472 = v410;
                            do
                            {
                              v473 = v472 + 1;
                              v474 = v413 + ~((-2 - v472) % (int)v413);
                              if (v472 > -2)
                                v474 = v472 + 1;
                              v475 = v473 % (int)v413;
                              v58 = v473 < (int)v413;
                              v476 = v442 + 48 * v472;
                              if (v58)
                                v472 = v474;
                              else
                                v472 = v475;
                              v477 = v442 + 48 * v472;
                              v478 = *(double *)(v476 + 32);
                              v479 = *(double *)(v476 + 40);
                              v481 = *(double *)(v477 + 32);
                              v480 = *(double *)(v477 + 40);
                              v482 = v481 - v478;
                              v483 = v480 - v479;
                              v484 = v555 * (v480 - v479) - (v481 - v478) * v553;
                              v485 = v466 * (v480 - v479) - (v481 - v478) * v467;
                              v486 = v468 * (v480 - v479) - (v481 - v478) * v469 + v484 + v485 * -2.0;
                              if (v486 == 0.0)
                                goto LABEL_448;
                              v487 = v485 + v485 + v484 * -2.0;
                              v488 = v484 * (v486 * v408) + v487 * v487;
                              if (v488 < 0.0)
                                goto LABEL_448;
                              v489 = sqrt(v488);
                              v490 = v486 + v486;
                              v491 = (v489 - v487) / v490;
                              if (v491 < 0.0 || v491 > 1.0)
                              {
                                v491 = (-v487 - v489) / v490;
                                if (v491 < 0.0 || v491 > 1.0)
                                  goto LABEL_448;
                              }
                              if (v491 < -0.5)
                                goto LABEL_448;
                              v494 = sqrt((v479 - v480) * (v479 - v480) + (v478 - v481) * (v478 - v481));
                              if (v494 == 0.0)
                                goto LABEL_448;
                              v495 = 1.0 - v491;
                              v496 = (v482
                                    * (v463 * (v491 * (v495 * v495) * 3.0)
                                     + v495 * (v495 * v495) * v446
                                     + v491 * v491 * (1.0 - v491) * 3.0 * v465
                                     + v491 * (v491 * v491) * v455
                                     - v479)
                                    - (v462 * (v491 * (v495 * v495) * 3.0)
                                     + v495 * (v495 * v495) * v445
                                     + v491 * v491 * (1.0 - v491) * 3.0 * v464
                                     + v491 * (v491 * v491) * v454
                                     - v478)
                                    * v483)
                                   / v494;
                              v497 = (v482 * (v417[2 * v472 + 1] - v479) - (v417[2 * v472] - v478) * v483)
                                   / v494
                                   * (*(double *)(*(_QWORD *)(v334 + 96) + 8 * v472)
                                    * 0.75);
                              v498 = -v497;
                              if (v497 >= 0.0)
                                v499 = v496;
                              else
                                v499 = -v496;
                              if (v497 >= 0.0)
                                v498 = v497;
                              if (v499 < v498 - v552)
                                goto LABEL_448;
                              if (v499 < v498)
                              {
                                v470 = v471 + (v499 - v498) * (v499 - v498);
                                v471 = v470;
                              }
                            }
                            while (v472 != (_DWORD)v412);
                            v500 = v338[v407];
                            v501 = v338[v410] + 1;
                            if (v500 > v501)
                            {
                              v502 = v470 + *(double *)&v558[v410];
                              goto LABEL_528;
                            }
                            if (v500 == v501)
                            {
                              v502 = v470 + *(double *)&v558[v410];
                              if (*(double *)&v558[v407] > v502)
                              {
LABEL_528:
                                v337[v407] = v410;
                                *(double *)&v558[v407] = v502;
                                v338[v407] = v338[v410] + 1;
                                *v411 = v470;
                                v411[1] = v462;
                                v411[2] = v463;
                                v411[3] = v464;
                                v411[4] = v465;
                                v411[5] = v549;
                                v411[6] = v544;
                                v411[7] = v543;
                              }
                            }
                            v58 = (int)v410-- <= 0;
                            if (v58)
                              break;
                            continue;
                          }
                          while (1)
                          {
                            v503 = v414 + 1;
                            v504 = v413 + ~((-2 - (int)v414) % (int)v413);
                            if ((int)v414 > -2)
                              v504 = v414 + 1;
                            v505 = v503 % (int)v413;
                            v58 = v503 < (int)v413;
                            v506 = &v417[2 * (int)v414];
                            LODWORD(v414) = v58 ? v504 : v505;
                            v507 = &v417[2 * (int)v414];
                            v508 = *v506;
                            v509 = v506[1];
                            v510 = *v507;
                            v511 = v507[1];
                            v512 = *v507 - *v506;
                            v513 = v511 - v509;
                            v514 = v555 * (v511 - v509) - v512 * v553;
                            v515 = v466 * (v511 - v509) - v512 * v467;
                            v516 = v468 * (v511 - v509) - v512 * v469 + v514 + v515 * -2.0;
                            if (v516 == 0.0)
                              break;
                            v517 = v515 + v515 + v514 * -2.0;
                            v518 = v514 * (v516 * v408) + v517 * v517;
                            if (v518 < 0.0)
                              break;
                            v519 = sqrt(v518);
                            v520 = v516 + v516;
                            v521 = (v519 - v517) / (v516 + v516);
                            if (v521 < 0.0 || v521 > 1.0)
                            {
                              v521 = (-v517 - v519) / v520;
                              if (v521 < 0.0 || v521 > 1.0)
                                break;
                            }
                            if (v521 < -0.5)
                              break;
                            v524 = v508 - v510;
                            v525 = v509 - v511;
                            v526 = sqrt(v525 * v525 + v524 * v524);
                            if (v526 == 0.0)
                              break;
                            v527 = 1.0 - v521;
                            v528 = v527 * (v527 * v527);
                            v529 = v521 * (v527 * v527) * 3.0;
                            v530 = v521 * v521 * (1.0 - v521) * 3.0;
                            v531 = v521 * (v521 * v521);
                            v532 = v462 * v529 + v528 * v445 + v530 * v464 + v531 * v454;
                            v533 = v463 * v529 + v528 * v446;
                            v408 = -4.0;
                            v534 = v533 + v530 * v465 + v531 * v455;
                            v535 = v532 - v508;
                            v536 = v534 - v509;
                            v537 = (v512 * v536 - (v532 - v508) * v513) / v526;
                            if (fabs(v537) > v552
                              || v513 * v536 + v512 * v535 < 0.0
                              || v525 * (v534 - v511) + v524 * (v532 - v510) < 0.0)
                            {
                              break;
                            }
                            v470 = v470 + v537 * v537;
                            if ((_DWORD)v414 == (_DWORD)v412)
                              goto LABEL_498;
                          }
                        }
                      }
                    }
                  }
                  break;
                }
              }
LABEL_448:
              ++v407;
              ++v406;
              if (v407 == v336)
                goto LABEL_374;
            }
          }
          *v341 = 0;
          *v337 = -1;
          *v558 = 0;
          *v338 = 0;
LABEL_374:
          v347 = v338[(int)v335];
          if (!sub_229080C50(v334 + 120, v347))
          {
            v348 = (double *)malloc_type_calloc(v347, 8uLL, 0x100004000313F17uLL);
            if (!v348)
              goto LABEL_576;
            v349 = (double *)malloc_type_calloc(v347, 8uLL, 0x100004000313F17uLL);
            if (!v349)
              goto LABEL_576;
            v350 = v349;
            v9 = 4.0;
            v10 = -0.5;
            v11 = 1.0;
            if (v347 < 1)
              goto LABEL_410;
            v351 = v347 + 1;
            LODWORD(v352) = v335;
            while (2)
            {
              while (1)
              {
                v361 = v351 - 2;
                v362 = (int)v352;
                if (v337[(int)v352] == (_DWORD)v352 - 1)
                  break;
                v370 = (v351 - 2);
                *(_DWORD *)(*(_QWORD *)(v334 + 128) + 4 * v361) = 1;
                v371 = 48 * v370;
                v372 = &v551[64 * (uint64_t)(int)v352];
                *(_OWORD *)(*(_QWORD *)(v334 + 136) + v371) = *(_OWORD *)(v372 + 8);
                *(_OWORD *)(*(_QWORD *)(v334 + 136) + v371 + 16) = *(_OWORD *)(v372 + 24);
                if ((int)v352 < (int)v335)
                {
                  v353 = v335 + ~(~(_DWORD)v352 % (int)v335);
                  if ((int)v352 >= 0)
                    v353 = v352;
                }
                else
                {
                  v353 = (int)v352 % (int)v335;
                }
                *(_OWORD *)(*(_QWORD *)(v334 + 136) + v371 + 32) = *(_OWORD *)(*(_QWORD *)(v334 + 72) + 48 * v353 + 32);
                v354 = (double *)&v551[64 * (uint64_t)(int)v352];
                v355 = (int)v352 % (int)v335;
                v356 = (int)v335 + ~(~(_DWORD)v352 % (int)v335);
                v357 = v352;
                if ((int)v352 >= 0)
                  v356 = (int)v352;
                else
                  v357 = (int)v335 + ~(~(_DWORD)v352 % (int)v335);
                v358 = (int)v352 < (int)v335;
                if ((int)v352 < (int)v335)
                  v352 = v357;
                else
                  v352 = (int)v352 % (int)v335;
                if (v358)
                  v355 = v356;
                v359 = *(float64x2_t *)(*(_QWORD *)(v334 + 72) + 48 * v352 + 32);
                *(float64x2_t *)(*(_QWORD *)(v334 + 152) + 16 * v370) = vmlaq_n_f64(v359, vsubq_f64(*(float64x2_t *)(*(_QWORD *)(v334 + 88)+ 16 * v355), v359), v354[6]);
                v360 = v370;
                *(double *)(*(_QWORD *)(v334 + 160) + v360 * 8) = v354[7];
                *(double *)(*(_QWORD *)(v334 + 168) + v360 * 8) = v354[7];
                v348[v360] = v354[6];
                v350[v360] = v354[5];
                LODWORD(v352) = v337[v362];
                if ((unint64_t)--v351 <= 1)
                {
LABEL_403:
                  v378 = 0;
                  v379 = *(_QWORD *)(v334 + 176);
                  do
                  {
                    v380 = v378 + 1;
                    if (v347 - 1 == v378)
                      v381 = 0;
                    else
                      v381 = v378 + 1;
                    if (v380 < v347)
                      v381 = v378 + 1;
                    *(double *)(v379 + 8 * v378) = v348[v378] / (v348[v378] + v350[v381]);
                    ++v378;
                  }
                  while (v347 != v380);
LABEL_410:
                  *(_DWORD *)(v334 + 144) = 1;
                  free(v337);
                  free(v558);
                  free(v338);
                  free(v551);
                  free(v348);
                  free(v350);
                  free(v340);
                  free(v548);
                  v286 = v550;
                  v382 = *(_QWORD *)(v550 + 56);
                  v3 = a3;
                  *(_QWORD *)(v382 + 184) = v382 + 120;
                  sub_229080D9C(v382 + 120, v550 + 8);
                  v346 = *(void (**)(_QWORD, double))a3;
                  if (*(_QWORD *)a3)
                  {
LABEL_411:
                    v546 = v546 + (double)**(int **)(v286 + 56);
                    v383 = v3[3] * (v546 / v6) + v3[2] * (v11 - v546 / v6);
                    if (v546 / v6 == v11 || v383 >= v3[6] + v3[4])
                    {
                      v346(*((_QWORD *)v3 + 1), v383);
                      v3[6] = v383;
                    }
                  }
LABEL_414:
                  v4 = *(_QWORD *)(v286 + 32);
                  if (!v4)
                  {
                    v5 = *(void (**)(_QWORD, double))v3;
                    goto LABEL_572;
                  }
                  goto LABEL_9;
                }
              }
              v363 = *(_QWORD *)(v334 + 64);
              if ((int)v352 >= (int)v335)
              {
                v369 = (int)v352 % (int)v335;
                *(_DWORD *)(*(_QWORD *)(v334 + 128) + 4 * v361) = *(_DWORD *)(v363 + 4 * v369);
                v366 = (v351 - 2);
                v373 = 48 * v366;
                v374 = 48 * v369;
                *(_OWORD *)(*(_QWORD *)(v334 + 136) + v373) = *(_OWORD *)(*(_QWORD *)(v334 + 72) + 48 * v369);
                *(_OWORD *)(*(_QWORD *)(v334 + 136) + v373 + 16) = *(_OWORD *)(*(_QWORD *)(v334 + 72) + 48 * v369 + 16);
                v375 = *(_QWORD *)(v334 + 136) + 48 * v366;
              }
              else
              {
                v364 = (int)v352;
                if ((v352 & 0x80000000) != 0)
                  v364 = (int)v335 + ~(~(_DWORD)v352 % (int)v335);
                v365 = *(_DWORD *)(v363 + 4 * v364);
                v366 = (v351 - 2);
                *(_DWORD *)(*(_QWORD *)(v334 + 128) + 4 * v361) = v365;
                v367 = (_OWORD *)(*(_QWORD *)(v334 + 136) + 48 * v361);
                v368 = *(_QWORD *)(v334 + 72);
                if ((v352 & 0x80000000) == 0)
                {
                  *v367 = *(_OWORD *)(v368 + 48 * (int)v352);
                  *(_OWORD *)(*(_QWORD *)(v334 + 136) + 48 * v366 + 16) = *(_OWORD *)(*(_QWORD *)(v334 + 72)
                                                                                    + 48 * (int)v352
                                                                                    + 16);
                  v369 = v352;
                  *(_OWORD *)(*(_QWORD *)(v334 + 136) + 48 * v366 + 32) = *(_OWORD *)(*(_QWORD *)(v334 + 72)
                                                                                    + 48 * v352
                                                                                    + 32);
                  v352 = (int)v352;
                  goto LABEL_402;
                }
                v369 = (int)v335 + ~(~(_DWORD)v352 % (int)v335);
                v374 = 48 * v369;
                *v367 = *(_OWORD *)(v368 + 48 * v369);
                *(_OWORD *)(*(_QWORD *)(v334 + 136) + 48 * v366 + 16) = *(_OWORD *)(*(_QWORD *)(v334 + 72)
                                                                                  + 48 * v369
                                                                                  + 16);
                v375 = *(_QWORD *)(v334 + 136) + 48 * v366;
              }
              *(_OWORD *)(v375 + 32) = *(_OWORD *)(*(_QWORD *)(v334 + 72) + v374 + 32);
              v352 = v369;
LABEL_402:
              *(_OWORD *)(*(_QWORD *)(v334 + 152) + 16 * v366) = *(_OWORD *)(*(_QWORD *)(v334 + 88) + 16 * v369);
              v376 = 8 * v369;
              v377 = 8 * v366;
              *(_QWORD *)(*(_QWORD *)(v334 + 160) + v377) = *(_QWORD *)(*(_QWORD *)(v334 + 96) + v376);
              *(_QWORD *)(*(_QWORD *)(v334 + 168) + v377) = *(_QWORD *)(*(_QWORD *)(v334 + 104) + v376);
              *(_QWORD *)(*(_QWORD *)(v334 + 176) + v377) = *(_QWORD *)(*(_QWORD *)(v334 + 112) + 8 * v352);
              v350[(unint64_t)v377 / 8] = 1.0;
              v348[(unint64_t)v377 / 8] = 1.0;
              LODWORD(v352) = v337[v362];
              if ((unint64_t)--v351 <= 1)
                goto LABEL_403;
              continue;
            }
          }
          v348 = 0;
LABEL_576:
          v539 = v551;
          v540 = v548;
        }
        else
        {
          v348 = 0;
          v540 = 0;
          v539 = v551;
        }
      }
      else
      {
        v558 = 0;
        v338 = 0;
LABEL_565:
        v539 = 0;
        v348 = 0;
        v340 = 0;
        v540 = 0;
      }
      free(v337);
      free(v558);
      free(v338);
      free(v539);
      free(v348);
      free(v340);
      v538 = v540;
    }
    else
    {
      v33 = 0;
LABEL_568:
      v169 = v557;
LABEL_569:
      free(v169);
LABEL_570:
      free(v31);
      v538 = v33;
    }
  }
  else
  {
    v104 = 0;
LABEL_559:
    v105 = 0;
LABEL_560:
    v106 = 0;
LABEL_561:
    v107 = 0;
LABEL_562:
    v109 = 0;
LABEL_563:
    free(v103);
    free(v104);
    free(v105);
    free(v106);
    free(v107);
    v538 = v109;
  }
  free(v538);
  return 1;
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t CARenderServerRenderLayerWithTransform()
{
  return MEMORY[0x24BDE5550]();
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x24BDBD940](context);
}

size_t CGBitmapContextGetBitsPerComponent(CGContextRef context)
{
  return MEMORY[0x24BDBD948](context);
}

size_t CGBitmapContextGetBitsPerPixel(CGContextRef context)
{
  return MEMORY[0x24BDBD950](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x24BDBD958](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBD960](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x24BDBD968](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x24BDBD970](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x24BDBD978](context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x24BDBDA78](space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDAF0](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x24BDBDAF8](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDB48](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB80]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateLab(const CGFloat *whitePoint, const CGFloat *blackPoint, const CGFloat *range)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB98](whitePoint, blackPoint, range);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

CGColorSpaceRef CGColorSpaceCreateWithPropertyList(CFPropertyListRef plist)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBC0](plist);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x24BDBDC20](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x24BDBDC98]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x24BDBDCA8]();
}

void CGContextAddCurveToPoint(CGContextRef c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCC0](c, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x24BDBDD00](c);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x24BDBDD08](c, auxiliaryInfo);
}

void CGContextBeginTransparencyLayerWithRect(CGContextRef c, CGRect rect, CFDictionaryRef auxInfo)
{
  MEMORY[0x24BDBDD10](c, auxInfo, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

CGRect CGContextConvertRectToDeviceSpace(CGContextRef c, CGRect rect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBDD68](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect CGContextConvertRectToUserSpace(CGContextRef c, CGRect rect)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBDD70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGSize CGContextConvertSizeToDeviceSpace(CGContextRef c, CGSize size)
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x24BDBDD78](c, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

CGSize CGContextConvertSizeToUserSpace(CGContextRef c, CGSize size)
{
  double v2;
  double v3;
  CGSize result;

  MEMORY[0x24BDBDD80](c, (__n128)size, *(__n128 *)&size.height);
  result.height = v3;
  result.width = v2;
  return result;
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
  MEMORY[0x24BDBDE00](c, page);
}

void CGContextEOClip(CGContextRef c)
{
  MEMORY[0x24BDBDE40](c);
}

void CGContextEOFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE48](c);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x24BDBDE58](c);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFlush(CGContextRef c)
{
  MEMORY[0x24BDBDE78](c);
}

CGAffineTransform *__cdecl CGContextGetCTM(CGAffineTransform *__return_ptr retstr, CGContextRef c)
{
  return (CGAffineTransform *)MEMORY[0x24BDBDE98](retstr, c);
}

CGRect CGContextGetClipBoundingBox(CGContextRef c)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBDEA0](c);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CGContextGetType()
{
  return MEMORY[0x24BDBDF10]();
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
  MEMORY[0x24BDBDF80](c, allowsAntialiasing);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetFlatness(CGContextRef c, CGFloat flatness)
{
  MEMORY[0x24BDBDFE8](c, flatness);
}

void CGContextSetGrayFillColor(CGContextRef c, CGFloat gray, CGFloat alpha)
{
  MEMORY[0x24BDBE008](c, gray, alpha);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineDash(CGContextRef c, CGFloat phase, const CGFloat *lengths, size_t count)
{
  MEMORY[0x24BDBE028](c, lengths, count, phase);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x24BDBE030](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetMiterLimit(CGContextRef c, CGFloat limit)
{
  MEMORY[0x24BDBE048](c, limit);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE068](c, red, green, blue, alpha);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
  MEMORY[0x24BDBE088](c, shouldAntialias);
}

void CGContextSetShouldSmoothFonts(CGContextRef c, BOOL shouldSmoothFonts)
{
  MEMORY[0x24BDBE098](c, shouldSmoothFonts);
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
  MEMORY[0x24BDBE0A0](c, shouldSubpixelPositionFonts);
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
  MEMORY[0x24BDBE0A8](c, shouldSubpixelQuantizeFonts);
}

void CGContextSetStrokeColorSpace(CGContextRef c, CGColorSpaceRef space)
{
  MEMORY[0x24BDBE0C8](c, space);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokeEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE108](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokeLineSegments(CGContextRef c, const CGPoint *points, size_t count)
{
  MEMORY[0x24BDBE110](c, points, count);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return (CGDataConsumerRef)MEMORY[0x24BDBE148](data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
  MEMORY[0x24BDBE160](consumer);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE180](data);
}

CGDataProviderRef CGDataProviderCreateWithData(void *info, const void *data, size_t size, CGDataProviderReleaseDataCallback releaseData)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE190](info, data, size, releaseData);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x24BDBE1C8](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x24BDBE5E0](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

CFTypeID CGImageGetTypeID(void)
{
  return MEMORY[0x24BDBE6D8]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

uint64_t CGImageSetProperty()
{
  return MEMORY[0x24BDBE780]();
}

uint64_t CGImageWriteToFile()
{
  return MEMORY[0x24BDBE7C8]();
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
  MEMORY[0x24BDBE8D8](context, pageInfo);
}

void CGPDFContextClose(CGContextRef context)
{
  MEMORY[0x24BDBE8E8](context);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x24BDBE8F0](consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
  MEMORY[0x24BDBE900](context);
}

CGPDFDocumentRef CGPDFDocumentCreateWithProvider(CGDataProviderRef provider)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEA00](provider);
}

size_t CGPDFDocumentGetNumberOfPages(CGPDFDocumentRef document)
{
  return MEMORY[0x24BDBEA68](document);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return (CGPDFPageRef)MEMORY[0x24BDBEA70](document, pageNumber);
}

void CGPDFDocumentRelease(CGPDFDocumentRef document)
{
  MEMORY[0x24BDBEAC8](document);
}

CGPDFDocumentRef CGPDFDocumentRetain(CGPDFDocumentRef document)
{
  return (CGPDFDocumentRef)MEMORY[0x24BDBEAD8](document);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEBF0](page, *(_QWORD *)&box);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x24BDBEDA8](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDB8](path, m, cp1x, cp1y, cp2x, cp2y, x, y);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDC0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x24BDBEDD8](path1, m, path2);
}

void CGPathAddQuadCurveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDE0](path, m, cpx, cpy, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathApply(CGPathRef path, void *info, CGPathApplierFunction function)
{
  MEMORY[0x24BDBEE08](path, info, function);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

BOOL CGPathContainsPoint(CGPathRef path, const CGAffineTransform *m, CGPoint point, BOOL eoFill)
{
  return MEMORY[0x24BDBEE28](path, m, eoFill, (__n128)point, *(__n128 *)&point.y);
}

CGPathRef CGPathCreateCopy(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEE30](path);
}

CGPathRef CGPathCreateCopyByStrokingPath(CGPathRef path, const CGAffineTransform *transform, CGFloat lineWidth, CGLineCap lineCap, CGLineJoin lineJoin, CGFloat miterLimit)
{
  return (CGPathRef)MEMORY[0x24BDBEE48](path, transform, *(_QWORD *)&lineCap, *(_QWORD *)&lineJoin, lineWidth, miterLimit);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEE60](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

CGMutablePathRef CGPathCreateMutableCopy(CGPathRef path)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE88](path);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEA8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x24BDBEEB0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEC0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGPoint CGPathGetCurrentPoint(CGPathRef path)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x24BDBEEC8](path);
  result.y = v2;
  result.x = v1;
  return result;
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBEEE0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGPathIsEmpty(CGPathRef path)
{
  return MEMORY[0x24BDBEF10](path);
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x24BDBEF48](path);
}

CGPathRef CGPathRetain(CGPathRef path)
{
  return (CGPathRef)MEMORY[0x24BDBEF50](path);
}

CFDictionaryRef CGPointCreateDictionaryRepresentation(CGPoint point)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEF98]((__n128)point, *(__n128 *)&point.y);
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return MEMORY[0x24BDBEFA8](dict, point);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x24BDBEFD0]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x24BDBF058]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x24BDBF068](dict, rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF080]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x24BDBF130]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x24BDBF140](dict, size);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x24BDD8488](allocator, *(_QWORD *)&options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x24BDD8498](manager, *(_QWORD *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x24BDD84A8](manager, callback, context);
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x24BDD84B0](manager, callback, context);
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BDD84D0](manager, runLoop, runLoopMode);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
  MEMORY[0x24BDD84E0](manager, matching);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDD8B48](buffer, key);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x24BDD8B68](buffer);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

size_t IOSurfaceGetBytesPerRow(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8BD0](buffer);
}

size_t IOSurfaceGetHeight(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C48](buffer);
}

size_t IOSurfaceGetWidth(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8CD0](buffer);
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  MEMORY[0x24BDD8CF0](buffer);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x24BDBCAA0](typePtr, sizep, alignp);
}

NSRect NSIntegralRectWithOptions(NSRect aRect, NSAlignmentOptions opts)
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSRect result;

  MEMORY[0x24BDD0E00](opts, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BDF6678]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BDF78C0]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BDF78E8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BDF78F0](context);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x24BDF7CC8](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x24BDF8090]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x24BDAC7F0](a1);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x24BDAD108](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x24BDAD110](a1);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB978](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB988](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

float hypotf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAE840](a1, a2);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x24BEDCF28](m1, m2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

float sinf(float a1)
{
  float result;

  MEMORY[0x24BDAFE20](a1);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

void vDSP_minvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x24BDB3270](__A, __IA, __C, __I, __N);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D0](__A, __I, __C, __N);
}

void vDSP_vlim(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3400](__A, __IA, __B, __C, __D, __ID, __N);
}

void vDSP_vthres(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3550](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_vthrsc(const float *__A, vDSP_Stride __IA, const float *__B, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3558](__A, __IA, __B, __C, __D, __ID, __N);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x24BDB3638](buf, format, backgroundColor, image, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_Planar8toPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, Pixel_F maxFloat, Pixel_F minFloat, vImage_Flags flags)
{
  return MEMORY[0x24BDB37A0](src, dest, *(_QWORD *)&flags, maxFloat, minFloat);
}

void xmlFreeDoc(xmlDocPtr cur)
{
  MEMORY[0x24BEDE760](cur);
}

xmlDocPtr xmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (xmlDocPtr)MEMORY[0x24BEDEB00](buffer, *(_QWORD *)&size, URL, encoding, *(_QWORD *)&options);
}

xmlXPathObjectPtr xmlXPathEvalExpression(const xmlChar *str, xmlXPathContextPtr ctxt)
{
  return (xmlXPathObjectPtr)MEMORY[0x24BEDEED0](str, ctxt);
}

void xmlXPathFreeContext(xmlXPathContextPtr ctxt)
{
  MEMORY[0x24BEDEEE8](ctxt);
}

void xmlXPathFreeObject(xmlXPathObjectPtr obj)
{
  MEMORY[0x24BEDEEF8](obj);
}

xmlXPathContextPtr xmlXPathNewContext(xmlDocPtr doc)
{
  return (xmlXPathContextPtr)MEMORY[0x24BEDEF58](doc);
}

int xmlXPathRegisterNs(xmlXPathContextPtr ctxt, const xmlChar *prefix, const xmlChar *ns_uri)
{
  return MEMORY[0x24BEDF038](ctxt, prefix, ns_uri);
}

