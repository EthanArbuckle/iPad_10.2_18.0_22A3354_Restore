@implementation MKLookAroundBumpFlash

- (void)flash
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double MidX;
  id v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  dispatch_time_t v25;
  id v26;
  _QWORD block[4];
  id v28;
  _QWORD v29[4];
  CGRect v30;
  CGRect v31;

  v29[3] = *MEMORY[0x1E0C80C00];
  -[MKLookAroundBumpFlash layer](self, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBounds:", v4, v6, v8, v10);
  v30.origin.x = v4;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  MidX = CGRectGetMidX(v30);
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.width = v8;
  v31.size.height = v10;
  objc_msgSend(v11, "setPosition:", MidX, CGRectGetMidY(v31));
  objc_msgSend(MEMORY[0x1E0CEA638], "_mapkit_imageNamed:", CFSTR("LookAroundBumpFlash"));
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "setContents:", objc_msgSend(v13, "CGImage"));
  objc_msgSend(v11, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);
  LODWORD(v14) = 0;
  objc_msgSend(v11, "setOpacity:", v14);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDuration:", 1.5);
  LODWORD(v16) = 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  makeAnimation((uint64_t)CFSTR("opacity"), &unk_1E2158490, v17, 0.0, 0.07);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v18;
  LODWORD(v19) = 0.5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  makeAnimation((uint64_t)CFSTR("opacity"), v20, &unk_1E2158490, 0.07, 0.5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v21;
  makeAnimation((uint64_t)CFSTR("transform.scale.xy"), &unk_1E21584A0, &unk_1E21584B0, 0.0, 0.6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAnimations:", v23);

  objc_msgSend(v11, "addAnimation:forKey:", v15, 0);
  objc_msgSend(v2, "addSublayer:", v11);
  objc_msgSend(v15, "duration");
  v25 = dispatch_time(0, (uint64_t)(v24 * 1000000000.0));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MKLookAroundBumpFlash_flash__block_invoke;
  block[3] = &unk_1E20D7D98;
  v28 = v11;
  v26 = v11;
  dispatch_after(v25, MEMORY[0x1E0C80D38], block);

}

uint64_t __30__MKLookAroundBumpFlash_flash__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

@end
