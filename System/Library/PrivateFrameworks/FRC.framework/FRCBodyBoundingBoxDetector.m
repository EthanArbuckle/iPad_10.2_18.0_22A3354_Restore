@implementation FRCBodyBoundingBoxDetector

- (id)createBodyRectanglesWithObservation:(id)a3 frameAspectRatio:(float)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  BodyPoint *v9;
  BodyPoint *v10;
  BodyPoint *v11;
  BodyPoint *v12;
  BodyPoint *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  float v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  float v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  float v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  id v59;
  BodyPoint *v61;
  BodyPoint *v62;
  BodyPoint *v63;
  uint64_t v64;

  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v6)
  {
    v7 = *MEMORY[0x1E0CEE3C0];
    v64 = 0;
    objc_msgSend(v5, "recognizedPointsForGroupKey:error:", v7, &v64);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(BodyPoint);
    v10 = objc_alloc_init(BodyPoint);
    v11 = objc_alloc_init(BodyPoint);
    v63 = objc_alloc_init(BodyPoint);
    v12 = objc_alloc_init(BodyPoint);
    v13 = objc_alloc_init(BodyPoint);
    v62 = objc_alloc_init(BodyPoint);
    v61 = objc_alloc_init(BodyPoint);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("left_hand_joint"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "location");
      -[BodyPoint setLocation:](v9, "setLocation:");
      objc_msgSend(v15, "confidence");
      -[BodyPoint setScore:](v9, "setScore:");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("right_hand_joint"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "location");
      -[BodyPoint setLocation:](v10, "setLocation:");
      objc_msgSend(v16, "confidence");
      -[BodyPoint setScore:](v10, "setScore:");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("left_forearm_joint"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "location");
      -[BodyPoint setLocation:](v11, "setLocation:");
      objc_msgSend(v17, "confidence");
      -[BodyPoint setScore:](v11, "setScore:");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("right_forearm_joint"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "location");
      -[BodyPoint setLocation:](v63, "setLocation:");
      objc_msgSend(v18, "confidence");
      -[BodyPoint setScore:](v63, "setScore:");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("left_foot_joint"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "location");
      -[BodyPoint setLocation:](v12, "setLocation:");
      objc_msgSend(v19, "confidence");
      -[BodyPoint setScore:](v12, "setScore:");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("right_foot_joint"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "location");
      -[BodyPoint setLocation:](v13, "setLocation:");
      objc_msgSend(v20, "confidence");
      -[BodyPoint setScore:](v13, "setScore:");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("left_leg_joint"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v21, "location");
      -[BodyPoint setLocation:](v62, "setLocation:");
      objc_msgSend(v21, "confidence");
      -[BodyPoint setScore:](v62, "setScore:");
    }
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("right_leg_joint"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "location");
      -[BodyPoint setLocation:](v61, "setLocation:");
      objc_msgSend(v22, "confidence");
      -[BodyPoint setScore:](v61, "setScore:");
    }
    -[BodyPoint score](v9, "score");
    if (v23 > 0.5)
    {
      -[BodyPoint location](v9, "location");
      v25 = v24;
      v27 = v26;
      -[BodyPoint location](v11, "location");
      *(float *)&v28 = a4;
      +[FRCFaceHandLegRectangle bodyRectangleWithCenter:tip:category:frameAspectRatio:](FRCFaceHandLegRectangle, "bodyRectangleWithCenter:tip:category:frameAspectRatio:", 2, v25, v27, v29, v30, v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v31);

    }
    -[BodyPoint score](v10, "score");
    if (v32 > 0.5)
    {
      -[BodyPoint location](v10, "location");
      v34 = v33;
      v36 = v35;
      -[BodyPoint location](v63, "location");
      *(float *)&v37 = a4;
      +[FRCFaceHandLegRectangle bodyRectangleWithCenter:tip:category:frameAspectRatio:](FRCFaceHandLegRectangle, "bodyRectangleWithCenter:tip:category:frameAspectRatio:", 2, v34, v36, v38, v39, v37);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v40);

    }
    -[BodyPoint score](v12, "score");
    if (v41 > 0.5)
    {
      -[BodyPoint location](v12, "location");
      v43 = v42;
      v45 = v44;
      -[BodyPoint location](v62, "location");
      *(float *)&v46 = a4;
      +[FRCFaceHandLegRectangle bodyRectangleWithCenter:tip:category:frameAspectRatio:](FRCFaceHandLegRectangle, "bodyRectangleWithCenter:tip:category:frameAspectRatio:", 3, v43, v45, v47, v48, v46);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v49);

    }
    -[BodyPoint score](v13, "score");
    if (v50 > 0.5)
    {
      -[BodyPoint location](v13, "location");
      v52 = v51;
      v54 = v53;
      -[BodyPoint location](v61, "location");
      *(float *)&v55 = a4;
      +[FRCFaceHandLegRectangle bodyRectangleWithCenter:tip:category:frameAspectRatio:](FRCFaceHandLegRectangle, "bodyRectangleWithCenter:tip:category:frameAspectRatio:", 3, v52, v54, v56, v57, v55);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v58);

    }
    v59 = v6;

  }
  return v6;
}

@end
