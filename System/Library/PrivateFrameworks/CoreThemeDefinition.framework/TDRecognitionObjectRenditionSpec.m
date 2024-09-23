@implementation TDRecognitionObjectRenditionSpec

- (__n128)referenceOriginTransform
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  __int128 v5;
  unsigned int v6;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  __int128 v11;

  objc_msgSend(a1, "a11");
  v10 = v2;
  objc_msgSend(a1, "a21");
  v9 = v3;
  objc_msgSend(a1, "a31");
  v8 = v4;
  objc_msgSend(a1, "a41");
  *(_QWORD *)&v5 = __PAIR64__(v9, v10);
  *((_QWORD *)&v5 + 1) = __PAIR64__(v6, v8);
  v11 = v5;
  objc_msgSend(a1, "a12");
  objc_msgSend(a1, "a22");
  objc_msgSend(a1, "a32");
  objc_msgSend(a1, "a42");
  objc_msgSend(a1, "a13");
  objc_msgSend(a1, "a23");
  objc_msgSend(a1, "a33");
  objc_msgSend(a1, "a43");
  objc_msgSend(a1, "a14");
  objc_msgSend(a1, "a24");
  objc_msgSend(a1, "a34");
  objc_msgSend(a1, "a44");
  return (__n128)v11;
}

- (uint64_t)setReferenceOriginTransform:(__n128)a3
{
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1, "setA11:");
  HIDWORD(v6) = a2.n128_u32[1];
  LODWORD(v6) = a2.n128_u32[1];
  objc_msgSend(a1, "setA21:", v6);
  objc_msgSend(a1, "setA31:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[2])));
  objc_msgSend(a1, "setA41:", COERCE_DOUBLE(__PAIR64__(a2.n128_u32[1], a2.n128_u32[3])));
  objc_msgSend(a1, "setA12:", a3.n128_f64[0]);
  HIDWORD(v7) = a3.n128_u32[1];
  LODWORD(v7) = a3.n128_u32[1];
  objc_msgSend(a1, "setA22:", v7);
  objc_msgSend(a1, "setA32:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[2])));
  objc_msgSend(a1, "setA42:", COERCE_DOUBLE(__PAIR64__(a3.n128_u32[1], a3.n128_u32[3])));
  objc_msgSend(a1, "setA13:", a4.n128_f64[0]);
  HIDWORD(v8) = a4.n128_u32[1];
  LODWORD(v8) = a4.n128_u32[1];
  objc_msgSend(a1, "setA23:", v8);
  objc_msgSend(a1, "setA33:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[2])));
  objc_msgSend(a1, "setA43:", COERCE_DOUBLE(__PAIR64__(a4.n128_u32[1], a4.n128_u32[3])));
  objc_msgSend(a1, "setA14:", a5.n128_f64[0]);
  HIDWORD(v9) = a5.n128_u32[1];
  LODWORD(v9) = a5.n128_u32[1];
  objc_msgSend(a1, "setA24:", v9);
  objc_msgSend(a1, "setA34:", COERCE_DOUBLE(__PAIR64__(a5.n128_u32[1], a5.n128_u32[2])));
  return objc_msgSend(a1, "setA44:", COERCE_DOUBLE(__PAIR64__(a5.n128_u32[1], a5.n128_u32[3])));
}

- (id)createCSIRepresentationWithCompression:(BOOL)a3 colorSpaceID:(unint64_t)a4 document:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v14 = 0;
  v7 = (void *)-[TDRecognitionObjectRenditionSpec asset](self, "asset", a3, a4);
  v8 = (void *)objc_msgSend(v7, "fileURLWithDocument:", a5);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfURL:options:error:", v8, 2, 0);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE28C20]), "initWithRawData:pixelFormat:layout:", v9, 1145132097, 1014);
  objc_msgSend(v10, "setName:", objc_msgSend(v7, "name"));
  -[TDRecognitionObjectRenditionSpec referenceOriginTransform](self, "referenceOriginTransform");
  objc_msgSend(v10, "setTransformation:");
  objc_msgSend(v10, "setObjectVersion:", -[TDRecognitionObjectRenditionSpec version](self, "version"));
  objc_msgSend(v10, "setCompressionType:", 2);

  if (objc_msgSend((id)objc_msgSend((id)-[TDRecognitionObjectRenditionSpec production](self, "production"), "universalTypeIdentifier"), "length"))
  {
    v11 = objc_msgSend((id)-[TDRecognitionObjectRenditionSpec production](self, "production"), "universalTypeIdentifier");
  }
  else
  {
    if (!objc_msgSend(v8, "getResourceValue:forKey:error:", &v14, *MEMORY[0x24BDBCCF0], 0))
    {
      objc_msgSend(v10, "setName:", objc_msgSend(v7, "name"));
      goto LABEL_7;
    }
    v11 = v14;
  }
  objc_msgSend(v10, "setUtiType:", v11);
LABEL_7:
  v12 = (void *)objc_msgSend(v10, "CSIRepresentationWithCompression:", 1);

  return v12;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("TDRecognitionObjectRenditionSpec"));
}

@end
