@implementation MKDefaultCoordinateRegion

void __MKDefaultCoordinateRegion_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  v19 = objc_alloc_init(MEMORY[0x1E0CFA978]);
  objc_msgSend(v19, "localeWithCode:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("mapLatitude"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("mapLongitude"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("mapHeight"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("mapWidth"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v4)
      v9 = v5 == 0;
    else
      v9 = 1;
    if (v9 || v6 == 0 || v7 == 0)
    {
      xmmword_1ECE2DDA0 = MKCoordinateRegionInvalid;
      *(_OWORD *)&qword_1ECE2DDB0 = unk_18B2AF990;
    }
    else
    {
      objc_msgSend(v4, "_mapkit_cgFloatValue");
      v13 = v12;
      objc_msgSend(v5, "_mapkit_cgFloatValue");
      v15 = v14;
      objc_msgSend(v6, "_mapkit_cgFloatValue");
      v17 = v16;
      objc_msgSend(v8, "_mapkit_cgFloatValue");
      *(_QWORD *)&xmmword_1ECE2DDA0 = v13;
      *((_QWORD *)&xmmword_1ECE2DDA0 + 1) = v15;
      qword_1ECE2DDB0 = v17;
      unk_1ECE2DDB8 = v18;
    }

  }
  else
  {
    xmmword_1ECE2DDA0 = MKCoordinateRegionInvalid;
    *(_OWORD *)&qword_1ECE2DDB0 = unk_18B2AF990;
  }

}

@end
