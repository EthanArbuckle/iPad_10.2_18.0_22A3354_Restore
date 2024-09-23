@implementation CIImage(Blur)

- (id)bluredImageWithFlippedXAxis:()Blur
{
  id v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  CGImage *v27;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  _QWORD v32[2];
  _QWORD v33[2];
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  objc_msgSend(v4, "extent");
  v6 = v5;
  v8 = v7;
  v9 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&v31.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&v31.c = v9;
  *(_OWORD *)&v31.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (a3)
  {
    CGAffineTransformMakeTranslation(&v31, v5, 0.0);
    v29 = v31;
    CGAffineTransformScale(&v30, &v29, -1.0, 1.0);
    v31 = v30;
  }
  objc_msgSend(MEMORY[0x24BDD1968], "value:withObjCType:", &v31, "{CGAffineTransform=dddddd}");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = 0;
  if (v4 && v10)
  {
    v13 = (void *)MEMORY[0x24BDBF658];
    v14 = *MEMORY[0x24BDBF960];
    v15 = *MEMORY[0x24BDBF9A8];
    v34[0] = *MEMORY[0x24BDBF960];
    v34[1] = v15;
    v35[0] = v4;
    v35[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filterWithName:withInputParameters:", CFSTR("CIAffineTransform"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "outputImage");
    v18 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v18;
    if (v18)
    {
      v19 = (void *)MEMORY[0x24BDBF658];
      v20 = *MEMORY[0x24BDBF978];
      v32[0] = v14;
      v32[1] = v20;
      v33[0] = v18;
      v33[1] = &unk_24EE9BA08;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "filterWithName:withInputParameters:", CFSTR("CIGaussianBlur"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "outputImage");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *MEMORY[0x24BDBF090];
      v25 = *(double *)(MEMORY[0x24BDBF090] + 8);
      objc_msgSend(MEMORY[0x24BDBF648], "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (CGImage *)objc_msgSend(v26, "createCGImage:fromRect:", v23, v24, v25, v6, v8);

      objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:", v27);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v27);

      v17 = v22;
    }

  }
  return v12;
}

@end
