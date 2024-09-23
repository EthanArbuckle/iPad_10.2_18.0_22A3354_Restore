@implementation VCPImageCompositionAnalyzer

- (int)analyzePixelBuffer:(__CVBuffer *)a3 flags:(unint64_t *)a4 results:(id *)a5 cancel:(id)a6
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  VCPVanishingPointDetector *v12;
  id v13;
  void *v14;
  CGFloat v15;
  NSString *v16;
  NSPoint v17;
  NSString *v18;
  NSPoint v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  int v31;
  NSPoint v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  _QWORD v37[2];
  NSPoint v38;
  NSPoint v39;

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = a6;
  v9 = v8;
  if (v8 && ((*((uint64_t (**)(id))v8 + 2))(v8) & 1) != 0)
  {
    v10 = -128;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v12 = -[VCPVanishingPointDetector initWithImage:]([VCPVanishingPointDetector alloc], "initWithImage:", a3);
    v30 = 0;
    v10 = -[VCPVanishingPointDetector detect:withConfidence:dominantLine:](v12, "detect:withConfidence:dominantLine:", &v32, &v31, &v30);
    v13 = v30;
    v14 = v13;
    if (!v10)
    {
      v15 = 1.0 - (v32.y - v32.x * 0.0);
      v32.x = v32.x + v32.y * 0.0 + 0.0;
      v32.y = v15;
      objc_msgSend(v13, "objectForKey:", CFSTR("Point0"));
      v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      v17 = NSPointFromString(v16);

      objc_msgSend(v14, "objectForKey:", CFSTR("Point1"));
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v19 = NSPointFromString(v18);

      v38.x = v17.x + v17.y * 0.0 + 0.0;
      v38.y = 1.0 - (v17.y - v17.x * 0.0);
      v20 = (void *)MEMORY[0x1E0C99D20];
      NSStringFromPoint(v38);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v39.y = 1.0 - (v19.y - v19.x * 0.0);
      v39.x = v19.x + v19.y * 0.0 + 0.0;
      NSStringFromPoint(v39);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "arrayWithObjects:", v21, v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      NSStringFromPoint(v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v24, CFSTR("vanishingPoint"));

      LODWORD(v25) = v31;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v26, CFSTR("vanishingPointConfidence"));

      objc_msgSend(v11, "setObject:forKey:", v23, CFSTR("dominantLine"));
      v36 = CFSTR("CompositionResults");
      v33 = CFSTR("attributes");
      v34 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v28;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

@end
