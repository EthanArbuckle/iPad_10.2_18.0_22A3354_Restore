@implementation UIView(NTKWorldClockMap)

+ (id)ntk_gossamer_terminatorViewForDate:()NTKWorldClockMap size:
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  if (a1 == *MEMORY[0x1E0C9D820] && a2 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v11 = 0;
  }
  else
  {
    v8 = (objc_class *)MEMORY[0x1E0DC3F10];
    v9 = a5;
    v10 = [v8 alloc];
    v11 = (void *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a1, a2);
    NTKWorldClock_DayOfYearForDate(v9);

    NTKWorldClock_NightMaskPathForDayOfYear(v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2790], "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    objc_msgSend(v16, "setFrame:");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.1);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28[0] = objc_msgSend(v17, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28[1] = objc_msgSend(v18, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28[2] = objc_msgSend(v19, "CGColor");
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.1);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v28[3] = objc_msgSend(v20, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setColors:", v21);

    objc_msgSend(v16, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v16, "setEndPoint:", 1.0, 0.5);
    objc_msgSend(v16, "setLocations:", &unk_1E6CA9FD0);
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_retainAutorelease(v15);
    objc_msgSend(v22, "setPath:", objc_msgSend(v23, "CGPath"));
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v22, "setStrokeColor:", objc_msgSend(v24, "CGColor"));

    objc_msgSend(v22, "setLineWidth:", 1.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v22, "setFillColor:", objc_msgSend(v25, "CGColor"));

    objc_msgSend(v16, "setMask:", v22);
    objc_msgSend(v11, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSublayer:", v16);

  }
  return v11;
}

@end
