@implementation HURecordingEventCellFamiliarFacesView

- (HURecordingEventCellFamiliarFacesView)initWithFrame:(CGRect)a3
{
  HURecordingEventCellFamiliarFacesView *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *imageViews;
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
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSLayoutConstraint *leftTitleConstraint;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)HURecordingEventCellFamiliarFacesView;
  v3 = -[HURecordingEventCellFamiliarFacesView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[HURecordingEventCellFamiliarFacesView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", 20.0);

    -[HURecordingEventCellFamiliarFacesView titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView addSubview:](v3, "addSubview:", v6);

    -[HURecordingEventCellFamiliarFacesView faceCropImageViews](v3, "faceCropImageViews");
    v7 = objc_claimAutoreleasedReturnValue();
    imageViews = v3->_imageViews;
    v3->_imageViews = (NSArray *)v7;

    -[HURecordingEventCellFamiliarFacesView pointerView](v3, "pointerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView addSubview:](v3, "addSubview:", v9);

    -[HURecordingEventCellFamiliarFacesView pointerView](v3, "pointerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView sendSubviewToBack:](v3, "sendSubviewToBack:", v10);

    -[HURecordingEventCellFamiliarFacesView titleLabel](v3, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView rightAnchor](v3, "rightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13, -5.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    -[HURecordingEventCellFamiliarFacesView titleLabel](v3, "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "centerYAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView centerYAnchor](v3, "centerYAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

    -[HURecordingEventCellFamiliarFacesView titleLabel](v3, "titleLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "leftAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView leftAnchor](v3, "leftAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 40.0);
    v22 = objc_claimAutoreleasedReturnValue();
    leftTitleConstraint = v3->_leftTitleConstraint;
    v3->_leftTitleConstraint = (NSLayoutConstraint *)v22;

    -[NSLayoutConstraint setActive:](v3->_leftTitleConstraint, "setActive:", 1);
  }
  return v3;
}

- (void)updateWithPersonEvents:(id)a3 forCameraClip:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  HURecordingEventCellFamiliarFacesView *v48;
  _QWORD v49[4];
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47 = a4;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  -[HURecordingEventCellFamiliarFacesView imageViews](self, "imageViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "setHidden:", 1);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v9);
  }
  v48 = self;

  objc_msgSend(MEMORY[0x1E0D31220], "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v6, "count");
  if (v13)
  {
    v14 = v13;
    for (j = 0; j != v14; ++j)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", j);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "faceClassification");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "person");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "faceCropForPersonName:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", j);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addFaceCropImageObserver:forClip:usingSignificantEvent:", v48, v47, v21);

      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v23 = v6;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v52;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v52 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * k);
        objc_msgSend(v28, "faceClassification");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "person");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "setObject:forKey:", v28, v31);
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v25);
  }

  objc_msgSend(v22, "allValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __78__HURecordingEventCellFamiliarFacesView_updateWithPersonEvents_forCameraClip___block_invoke;
  v49[3] = &unk_1E6F4EA98;
  v33 = v12;
  v50 = v33;
  objc_msgSend(v32, "sortedArrayUsingComparator:", v49);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HURecordingEventCellFamiliarFacesView setSortedPeople:](v48, "setSortedPeople:", v34);

  -[HURecordingEventCellFamiliarFacesView sortedPeople](v48, "sortedPeople");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36 >= 3)
    v37 = 3;
  else
    v37 = v36;
  if (v37)
  {
    for (m = 0; m != v37; ++m)
    {
      -[HURecordingEventCellFamiliarFacesView sortedPeople](v48, "sortedPeople");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectAtIndexedSubscript:", m);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "faceClassification");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "person");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v42, "name");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "faceCropForPersonName:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v44)
      {
        +[HURecordingEventCellFamiliarFacesView placeholderImage](HURecordingEventCellFamiliarFacesView, "placeholderImage");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[HURecordingEventCellFamiliarFacesView imageViews](v48, "imageViews");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", m);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "setImage:", v44);
      objc_msgSend(v46, "setHidden:", 0);

    }
  }
  -[HURecordingEventCellFamiliarFacesView resizeWithMaxWidth:](v48, "resizeWithMaxWidth:", 118.0);

}

uint64_t __78__HURecordingEventCellFamiliarFacesView_updateWithPersonEvents_forCameraClip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "faceClassification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceCropForPersonName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(void **)(a1 + 32);
  objc_msgSend(v6, "faceClassification");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "person");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "faceCropForPersonName:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -1;
  if (v15)
    v16 = 1;
  if (v10)
    v17 = -1;
  else
    v17 = v16;

  return v17;
}

- (void)updateTitleLabel
{
  HURecordingEventCellFamiliarFacesView *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  HURecordingEventCellFamiliarFacesView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HURecordingEventCellFamiliarFacesView *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HURecordingEventCellFamiliarFacesView *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HURecordingEventCellFamiliarFacesView *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  _QWORD v104[3];

  v2 = self;
  v104[1] = *MEMORY[0x1E0C80C00];
  -[HURecordingEventCellFamiliarFacesView titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HURecordingEventCellFamiliarFacesView sortedPeople](v2, "sortedPeople");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  _HULocalizedStringWithDefaultValue(CFSTR("HUFaceRecognitionTimelineSeparator"), CFSTR("HUFaceRecognitionTimelineSeparator"), 1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v98 = v6;
  if (v6)
  {
    v97 = (void *)v7;
    v100 = v4;
    v9 = 0;
    v10 = 0;
    v11 = *MEMORY[0x1E0CEA098];
    do
    {
      v12 = v2;
      -[HURecordingEventCellFamiliarFacesView sortedPeople](v2, "sortedPeople");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "faceClassification");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "person");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v103 = v11;
      v104[0] = v100;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, &v103, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sizeWithAttributes:", v18);
      v20 = ceil(v19);

      v21 = v20 + 0.0;
      if (v9 == 1)
      {
        v101 = v11;
        v102 = v100;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "sizeWithAttributes:", v22);
        v21 = v21 + ceil(v23);

      }
      v2 = v12;
      -[HURecordingEventCellFamiliarFacesView maxWidthForNames](v12, "maxWidthForNames");
      if (v21 < v24)
        ++v9;

      ++v10;
    }
    while (v98 != v10);
    -[HURecordingEventCellFamiliarFacesView leftTitleConstraint](v12, "leftTitleConstraint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConstant:", 40.0);

    v4 = v100;
    v8 = v97;
    switch((unint64_t)v97)
    {
      case 0uLL:
        goto LABEL_14;
      case 1uLL:
        v26 = v98 - 1;
        if (v98 == 1)
          goto LABEL_14;
        v27 = (void *)MEMORY[0x1E0CB3940];
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "faceClassification");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "person");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "stringWithFormat:", CFSTR("%@%@+%lu"), v32, v97, v26);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURecordingEventCellFamiliarFacesView titleLabel](v2, "titleLabel");
        v34 = v2;
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setText:", v33);

        v4 = v100;
        if (v26 >= 2)
          v26 = 2;
        -[HURecordingEventCellFamiliarFacesView leftTitleConstraint](v34, "leftTitleConstraint");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constant");
        v38 = v37 + (double)v26 * 15.0;
        goto LABEL_18;
      case 2uLL:
        v45 = (void *)MEMORY[0x1E0CB3940];
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "objectAtIndexedSubscript:", 0);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "faceClassification");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "person");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "name");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v47 = v12;
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectAtIndexedSubscript:", 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "faceClassification");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "person");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "name");
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = (void *)v52;
        if (v98 == 2)
        {
          objc_msgSend(v45, "stringWithFormat:", CFSTR("%@%@%@"), v46, v97, v52);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[HURecordingEventCellFamiliarFacesView titleLabel](v47, "titleLabel");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setText:", v54);

          -[HURecordingEventCellFamiliarFacesView leftTitleConstraint](v47, "leftTitleConstraint");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "constant");
          v57 = 15.0;
        }
        else
        {
          objc_msgSend(v45, "stringWithFormat:", CFSTR("%@, %@%@+%lu"), v46, v52, v97, v98 - 2);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          -[HURecordingEventCellFamiliarFacesView titleLabel](v47, "titleLabel");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "setText:", v78);

LABEL_21:
          -[HURecordingEventCellFamiliarFacesView leftTitleConstraint](v47, "leftTitleConstraint");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "constant");
          v57 = 30.0;
        }
        objc_msgSend(v36, "setConstant:", v56 + v57);
        v4 = v100;
        break;
      case 3uLL:
        v58 = (void *)MEMORY[0x1E0CB3940];
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "objectAtIndexedSubscript:", 0);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "faceClassification");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v96, "person");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "name");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "objectAtIndexedSubscript:", 1);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "faceClassification");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "person");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "name");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectAtIndexedSubscript:", 2);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "faceClassification");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "person");
        v63 = v12;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "name");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "stringWithFormat:", CFSTR("%@, %@,%@%@"), v81, v59, v97, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURecordingEventCellFamiliarFacesView titleLabel](v63, "titleLabel");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setText:", v66);

        v4 = v100;
        -[HURecordingEventCellFamiliarFacesView leftTitleConstraint](v63, "leftTitleConstraint");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constant");
        v38 = v68 + 30.0;
LABEL_18:
        objc_msgSend(v36, "setConstant:", v38);
        break;
      default:
        v69 = (void *)MEMORY[0x1E0CB3940];
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "objectAtIndexedSubscript:", 0);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "faceClassification");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v93, "person");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "name");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "objectAtIndexedSubscript:", 1);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "faceClassification");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "person");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "name");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURecordingEventCellFamiliarFacesView sortedPeople](v12, "sortedPeople");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndexedSubscript:", 2);
        v47 = v12;
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "faceClassification");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "person");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "name");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v97;
        objc_msgSend(v69, "stringWithFormat:", CFSTR("%@, %@, %@%@+%lu"), v80, v70, v75, v97, v98 - 3);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        -[HURecordingEventCellFamiliarFacesView titleLabel](v47, "titleLabel");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "setText:", v76);

        goto LABEL_21;
    }
  }
  else
  {
    -[HURecordingEventCellFamiliarFacesView leftTitleConstraint](v2, "leftTitleConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setConstant:", 40.0);

LABEL_14:
    -[HURecordingEventCellFamiliarFacesView sortedPeople](v2, "sortedPeople");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "faceClassification");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "person");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView titleLabel](v2, "titleLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setText:", v43);

  }
}

- (void)resizeWithMaxWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  double v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  -[HURecordingEventCellFamiliarFacesView frame](self, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HURecordingEventCellFamiliarFacesView imageViews](self, "imageViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isHidden");

  if (v13)
    v14 = 40.0;
  else
    v14 = 55.0;
  -[HURecordingEventCellFamiliarFacesView imageViews](self, "imageViews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isHidden");

  v18 = v14 + 15.0;
  if (v17)
    v18 = v14;
  v19 = v18 + 10.0;
  -[HURecordingEventCellFamiliarFacesView setMaxWidthForNames:](self, "setMaxWidthForNames:", a3 - (v18 + 10.0));
  -[HURecordingEventCellFamiliarFacesView updateTitleLabel](self, "updateTitleLabel");
  -[HURecordingEventCellFamiliarFacesView titleLabel](self, "titleLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "text");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = *MEMORY[0x1E0CEA098];
  -[HURecordingEventCellFamiliarFacesView titleLabel](self, "titleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "font");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sizeWithAttributes:", v24);
  v26 = ceil(v25);

  if (v19 + v26 <= a3)
    v27 = v19 + v26;
  else
    v27 = a3;
  -[HURecordingEventCellFamiliarFacesView setFrame:](self, "setFrame:", v6, v8, v27, v10);
  HFLogForCategory();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    -[HURecordingEventCellFamiliarFacesView titleLabel](self, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "text");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HURecordingEventCellFamiliarFacesView maxWidthForNames](self, "maxWidthForNames");
    v32 = v31;
    -[HURecordingEventCellFamiliarFacesView frame](self, "frame");
    v34 = 138413058;
    v35 = v30;
    v36 = 2048;
    v37 = v32;
    v38 = 2048;
    v39 = v33;
    v40 = 2048;
    v41 = v19 + -10.0;
    _os_log_debug_impl(&dword_1B8E1E000, v28, OS_LOG_TYPE_DEBUG, "FF: Title text - %@. MaxWidth:%.0f CellWidth:%.0f ImageOffset:%.0f", (uint8_t *)&v34, 0x2Au);

  }
}

- (void)manager:(id)a3 didFindFaceCrop:(id)a4 forClip:(id)a5 usingPersonName:(id)a6
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  HURecordingEventCellFamiliarFacesView *v15;
  id v16;

  v8 = a4;
  v9 = a6;
  -[HURecordingEventCellFamiliarFacesView sortedPeople](self, "sortedPeople");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __89__HURecordingEventCellFamiliarFacesView_manager_didFindFaceCrop_forClip_usingPersonName___block_invoke;
  v13[3] = &unk_1E6F4EAC0;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

}

void __89__HURecordingEventCellFamiliarFacesView_manager_didFindFaceCrop_forClip_usingPersonName___block_invoke(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "faceClassification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "person");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqual:", *(_QWORD *)(a1 + 32));

  if (a3 <= 2 && v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "imageViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setImage:", *(_QWORD *)(a1 + 48));
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Did find face crop. Updated face crop image for %@ using personName:%@", (uint8_t *)&v16, 0x16u);
    }

    *a4 = 1;
  }
  else if (a3 >= 3)
  {
    *a4 = 1;
  }
}

- (void)manager:(id)a3 failedToFindFaceCropForPersonName:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to find face crop for personName:%@", (uint8_t *)&v6, 0xCu);
  }

}

- (id)faceCropImageViews
{
  NSArray *imageViews;
  int v4;
  NSArray *v5;
  double v6;
  void *v7;
  NSArray *v8;

  imageViews = self->_imageViews;
  if (!imageViews)
  {
    v4 = 3;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = 0.0;
    do
    {
      +[HURecordingEventCellFamiliarFacesView faceCropImageView](HURecordingEventCellFamiliarFacesView, "faceCropImageView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFrame:", v6 * 30.0 * 0.5 + 5.0, 5.0, 30.0, 30.0);
      -[NSArray addObject:](v5, "addObject:", v7);
      -[HURecordingEventCellFamiliarFacesView addSubview:](self, "addSubview:", v7);
      -[HURecordingEventCellFamiliarFacesView sendSubviewToBack:](self, "sendSubviewToBack:", v7);

      v6 = v6 + 1.0;
      --v4;
    }
    while (v4);
    v8 = self->_imageViews;
    self->_imageViews = v5;

    imageViews = self->_imageViews;
  }
  return imageViews;
}

- (UILabel)titleLabel
{
  UILabel *titleLabel;
  UILabel *v4;
  void *v5;
  void *v6;
  UILabel *v7;

  titleLabel = self->_titleLabel;
  if (!titleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[UILabel setFrame:](v4, "setFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UILabel setLineBreakMode:](v4, "setLineBreakMode:", 5);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", 16.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4, "setFont:", v6);

    v7 = self->_titleLabel;
    self->_titleLabel = v4;

    titleLabel = self->_titleLabel;
  }
  return titleLabel;
}

- (UIView)pointerView
{
  UIView *pointerView;
  void *v4;
  void *v5;
  UIView *v6;
  void *v7;
  void *v8;
  UIView *v9;
  CGAffineTransform v11;
  CGAffineTransform v12;

  pointerView = self->_pointerView;
  if (!pointerView)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 15.0, 15.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v5);

    CGAffineTransformMakeRotation(&v12, 0.785398163);
    v11 = v12;
    objc_msgSend(v4, "setTransform:", &v11);
    v6 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", 0.0, 0.0, 15.0, 15.0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

    -[UIView layer](v6, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 15.0);

    -[UIView setOpaque:](v6, "setOpaque:", 0);
    -[UIView addSubview:](v6, "addSubview:", v4);
    -[UIView center](v6, "center");
    objc_msgSend(v4, "setCenter:");
    -[UIView frame](v6, "frame");
    -[UIView setFrame:](v6, "setFrame:", 32.0, 28.0);
    v9 = self->_pointerView;
    self->_pointerView = v6;

    pointerView = self->_pointerView;
  }
  return pointerView;
}

+ (id)faceCropImageView
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA658]);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  objc_msgSend(v2, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", 15.0);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "CGColor");
  objc_msgSend(v2, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  objc_msgSend(v2, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBorderWidth:", 2.0);

  objc_msgSend(v2, "setClipsToBounds:", 1);
  objc_msgSend(v2, "setContentMode:", 2);
  return v2;
}

+ (id)placeholderImage
{
  if (qword_1EF2269C0 != -1)
    dispatch_once(&qword_1EF2269C0, &__block_literal_global_30);
  return (id)_MergedGlobals_3_1;
}

void __57__HURecordingEventCellFamiliarFacesView_placeholderImage__block_invoke()
{
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  __int128 v9;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA610]), "initWithSize:", 26.0, 26.0);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HURecordingEventCellFamiliarFacesView_placeholderImage__block_invoke_2;
  v8[3] = &__block_descriptor_48_e40_v16__0__UIGraphicsImageRendererContext_8l;
  __asm { FMOV            V0.2D, #26.0 }
  v9 = _Q0;
  objc_msgSend(v7, "imageWithActions:", v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)_MergedGlobals_3_1;
  _MergedGlobals_3_1 = v5;

}

void __57__HURecordingEventCellFamiliarFacesView_placeholderImage__block_invoke_2(uint64_t a1)
{
  id v2;

  HUImageNamed(CFSTR("CameraFamiliarFacePlaceholder"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "drawInRect:", 0.0, 0.0, *(double *)(a1 + 32), *(double *)(a1 + 40));

}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void)setPointerView:(id)a3
{
  objc_storeStrong((id *)&self->_pointerView, a3);
}

- (NSLayoutConstraint)leftTitleConstraint
{
  return self->_leftTitleConstraint;
}

- (void)setLeftTitleConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_leftTitleConstraint, a3);
}

- (double)maxWidthForNames
{
  return self->_maxWidthForNames;
}

- (void)setMaxWidthForNames:(double)a3
{
  self->_maxWidthForNames = a3;
}

- (NSArray)imageViews
{
  return self->_imageViews;
}

- (NSArray)sortedPeople
{
  return self->_sortedPeople;
}

- (void)setSortedPeople:(id)a3
{
  objc_storeStrong((id *)&self->_sortedPeople, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedPeople, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_leftTitleConstraint, 0);
  objc_storeStrong((id *)&self->_pointerView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
