@implementation HPSSpatialProfileSingleStepPillContainerView

- (HPSSpatialProfileSingleStepPillContainerView)initWithFrame:(CGRect)a3
{
  HPSSpatialProfileSingleStepPillContainerView *v3;
  HPSSpatialProfileSingleStepPillContainerView *v4;
  uint64_t v5;
  NSMutableSet *animatedFaceLayers;
  uint64_t v7;
  NSMutableArray *pillsStatusArray;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  BSUICAPackageView *micaView;
  NSArray *layerMappingLeft;
  NSArray *layerMappingRight;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)HPSSpatialProfileSingleStepPillContainerView;
  v3 = -[HPSSpatialProfileSingleStepPillContainerView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_rightEarStateComplete = 0;
    v3->_leftEarStateComplete = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = objc_claimAutoreleasedReturnValue();
    animatedFaceLayers = v4->_animatedFaceLayers;
    v4->_animatedFaceLayers = (NSMutableSet *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 33);
    pillsStatusArray = v4->_pillsStatusArray;
    v4->_pillsStatusArray = (NSMutableArray *)v7;

    v9 = 0;
    v10 = MEMORY[0x1E0C9AAA0];
    do
      -[NSMutableArray setObject:atIndexedSubscript:](v4->_pillsStatusArray, "setObject:atIndexedSubscript:", v10, v9++);
    while (v9 != 33);
    v4->_middleZero = 16;
    v4->_middleMinusOne = 15;
    v4->_middlePlusOne = 17;
    v4->_leftPillIndex = 1;
    v4->_rightPillIndex = 1;
    v11 = objc_alloc(MEMORY[0x1E0D01910]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithPackageName:inBundle:", CFSTR("Lines_Layout"), v12);
    micaView = v4->_micaView;
    v4->_micaView = (BSUICAPackageView *)v13;

    -[BSUICAPackageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_micaView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HPSSpatialProfileSingleStepPillContainerView addSubview:](v4, "addSubview:", v4->_micaView);
    layerMappingLeft = v4->_layerMappingLeft;
    v4->_layerMappingLeft = (NSArray *)&unk_1EA2B4E80;

    layerMappingRight = v4->_layerMappingRight;
    v4->_layerMappingRight = (NSArray *)&unk_1EA2B4E98;

    v27 = (void *)MEMORY[0x1E0CB3718];
    -[BSUICAPackageView leadingAnchor](v4->_micaView, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSSpatialProfileSingleStepPillContainerView leadingAnchor](v4, "leadingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v30;
    -[BSUICAPackageView trailingAnchor](v4->_micaView, "trailingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSSpatialProfileSingleStepPillContainerView trailingAnchor](v4, "trailingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v17;
    -[BSUICAPackageView topAnchor](v4->_micaView, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSSpatialProfileSingleStepPillContainerView topAnchor](v4, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v20;
    -[BSUICAPackageView bottomAnchor](v4->_micaView, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HPSSpatialProfileSingleStepPillContainerView bottomAnchor](v4, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "activateConstraints:", v24);

    -[BSUICAPackageView publishedObjectWithName:](v4->_micaView, "publishedObjectWithName:", CFSTR("mid_0"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUICAPackageView setState:onLayer:animated:transitionSpeed:completion:](v4->_micaView, "setState:onLayer:animated:transitionSpeed:completion:", CFSTR("Min"), v25, 0, 0, 1.0);

  }
  return v4;
}

- (void)updatePillsForPoseStatus:(id)a3 pillCount:(unsigned int *)a4 alongSideAction:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  unint64_t v22;
  _QWORD v24[4];
  id v25;
  unsigned int *v26;
  _QWORD v27[4];
  id v28;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "yawAngles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "debugDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Spatial Profile: HRTF backing data array: %@"), v11);

  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke;
  v27[3] = &unk_1EA29A6D8;
  v12 = v9;
  v28 = v12;
  -[HPSSpatialProfileSingleStepPillContainerView animateFaceAnglesIfneeded:withCompletion:](self, "animateFaceAnglesIfneeded:withCompletion:", v8, v27);
  objc_msgSend(v8, "yawAngles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    v15 = 0;
    v16 = 1;
    do
    {
      objc_msgSend(v8, "yawAngles");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "captured"))
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_pillsStatusArray, "objectAtIndexedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "BOOLValue");

        if ((v20 & 1) == 0)
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke_3;
          v24[3] = &unk_1EA29B488;
          v25 = v12;
          v26 = a4;
          -[HPSSpatialProfileSingleStepPillContainerView fillPill:updatePillsForPoseStatus:withCompletion:](self, "fillPill:updatePillsForPoseStatus:withCompletion:", v15, v8, v24);

        }
      }

      v15 = v16;
      objc_msgSend(v8, "yawAngles");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

    }
    while (v22 > v16++);
  }

}

uint64_t __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke_4;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v1 = *(_QWORD *)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  return (*(uint64_t (**)(uint64_t, _QWORD *))(v1 + 16))(v1, v3);
}

uint64_t __99__HPSSpatialProfileSingleStepPillContainerView_updatePillsForPoseStatus_pillCount_alongSideAction___block_invoke_4(uint64_t result)
{
  ++**(_DWORD **)(result + 32);
  return result;
}

- (void)fillPill:(unint64_t)a3 updatePillsForPoseStatus:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  unint64_t leftPillIndex;
  unint64_t rightPillIndex;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  unint64_t v18;

  v8 = a4;
  v9 = a5;
  leftPillIndex = self->_leftPillIndex;
  rightPillIndex = self->_rightPillIndex;
  objc_msgSend(v8, "currentYawAngle");
  NSLog(CFSTR("Spatial Profile: fillPill Index: %lu, %lu , %lu, yaw: %i"), a3, leftPillIndex, rightPillIndex, v12);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke;
  block[3] = &unk_1EA29B528;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = a3;
  v13 = v9;
  v14 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __CFString *v15;
  void *v16;
  dispatch_time_t v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id location;

  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD **)(a1 + 32);
  if (v2 == v3[61] || v2 == v3[60])
  {
    v4 = *(_QWORD *)(a1 + 40);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_2;
    v22[3] = &unk_1EA29B4B0;
    objc_copyWeak(&v24, &location);
    v22[4] = *(_QWORD *)(a1 + 32);
    v23 = *(id *)(a1 + 48);
    objc_msgSend(v3, "animateFaceAnglesIfneeded:withCompletion:", v4, v22);

    objc_destroyWeak(&v24);
    goto LABEL_20;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setObject:atIndexedSubscript:", v5, *(_QWORD *)(a1 + 56));

  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 472);
  if (v6 < v8)
  {
    v9 = 456;
    v10 = *(_QWORD *)(v7 + 456);
    if (v10 >= 6)
    {
      v11 = objc_msgSend(*(id *)(v7 + 440), "count");
      v7 = *(_QWORD *)(a1 + 32);
      if (v10 < v11)
      {
        objc_msgSend(*(id *)(v7 + 440), "objectAtIndexedSubscript:", *(_QWORD *)(v7 + 456));
        v12 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v15 = (__CFString *)v12;
        v7 = *(_QWORD *)(a1 + 32);
LABEL_15:
        ++*(_QWORD *)(v7 + v9);
        goto LABEL_16;
      }
    }
    goto LABEL_14;
  }
  if (v6 > v8)
  {
    v9 = 464;
    v13 = *(_QWORD *)(v7 + 464);
    if (v13 >= 6)
    {
      v14 = objc_msgSend(*(id *)(v7 + 448), "count");
      v7 = *(_QWORD *)(a1 + 32);
      if (v13 < v14)
      {
        objc_msgSend(*(id *)(v7 + 448), "objectAtIndexedSubscript:", *(_QWORD *)(v7 + 464));
        v12 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
LABEL_14:
    v15 = 0;
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(v7 + 424), "setObject:atIndexedSubscript:", &unk_1EA2B4F70);
  v15 = CFSTR("mid_0");
LABEL_16:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "publishedObjectWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Spatial Profile: index:%lu, layer name: %@, left progress index:%lu, right progress index: %lu"), *(_QWORD *)(a1 + 56), v15, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464));
  if (v15)
  {
    v17 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_83;
    block[3] = &unk_1EA29B500;
    block[4] = *(_QWORD *)(a1 + 32);
    v19 = v16;
    objc_copyWeak(&v21, &location);
    v20 = *(id *)(a1 + 48);
    dispatch_after(v17, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v21);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

LABEL_20:
  objc_destroyWeak(&location);
}

uint64_t __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_2(uint64_t a1)
{
  _BOOL8 v2;
  id *v3;
  id WeakRetained;
  _BOOL8 v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setRightEarStateComplete:", v2);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setLeftEarStateComplete:", v5);

  v7 = objc_loadWeakRetained(v3);
  LODWORD(v6) = objc_msgSend(v7, "rightEarStateComplete");
  v8 = objc_loadWeakRetained(v3);
  v9 = objc_msgSend(v8, "leftEarStateComplete");
  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "pillsStatusArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Spatial Profile: Phase 2 -> End, enrollment leftEarStateComplete:%i, rightEarStateComplete:%i, pillsStatusArray:%@"), v6, v9, v12);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_83(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 432);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_2_86;
  v4[3] = &unk_1EA29B4D8;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v3, "setState:onLayer:animated:transitionSpeed:completion:", CFSTR("Max"), v2, 1, v4, 1.0);

  objc_destroyWeak(&v6);
}

void __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_2_86(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_3;
  block[3] = &unk_1EA29B4B0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v6);
}

uint64_t __97__HPSSpatialProfileSingleStepPillContainerView_fillPill_updatePillsForPoseStatus_withCompletion___block_invoke_3(uint64_t a1)
{
  _BOOL8 v2;
  id *v3;
  id WeakRetained;
  _BOOL8 v5;
  id v6;
  id v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  void *v12;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 464) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
  v3 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setRightEarStateComplete:", v2);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456) == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 472);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "setLeftEarStateComplete:", v5);

  v7 = objc_loadWeakRetained(v3);
  LODWORD(v6) = objc_msgSend(v7, "rightEarStateComplete");
  v8 = objc_loadWeakRetained(v3);
  v9 = objc_msgSend(v8, "leftEarStateComplete");
  v10 = objc_loadWeakRetained(v3);
  objc_msgSend(v10, "pillsStatusArray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Spatial Profile: Phase 2 -> End, enrollment leftEarStateComplete:%i, rightEarStateComplete:%i, pillsStatusArray:%@"), v6, v9, v12);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)animateFaceAnglesIfneeded:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  HPSSpatialProfileSingleStepPillContainerView *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke;
  block[3] = &unk_1EA29A728;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  BOOL v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  BOOL v27;
  char v28;
  char v29;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "currentYawAngle");
  if (v2 == -100.0)
  {
    NSLog(CFSTR("Spatial Profile: invalid pitch yaw !"));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "currentYawAngle");
    v4 = v3 < 0.0;
    objc_msgSend(*(id *)(a1 + 32), "currentYawAngle");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "yawAngles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 488));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "captured");

    objc_msgSend(*(id *)(a1 + 32), "yawAngles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 480));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "captured");

    if (v12
      && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 480)), v13 = (void *)objc_claimAutoreleasedReturnValue(), v14 = objc_msgSend(v13, "intValue"), v13, !v14))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "setObject:atIndexedSubscript:", &unk_1EA2B4FA0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 480));
      objc_msgSend(*(id *)(a1 + 40), "pillsStatusArray");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Spatial Profile: Phase 2 -> End set _middleMinusOne %@"), v20);

      v4 = 1;
      v18 = &unk_1EA2B4EB0;
    }
    else if (v9
           && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 488)), v15 = (void *)objc_claimAutoreleasedReturnValue(), v16 = objc_msgSend(v15, "intValue"), v15, !v16))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 424), "setObject:atIndexedSubscript:", &unk_1EA2B4FA0, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 488));
      objc_msgSend(*(id *)(a1 + 40), "pillsStatusArray");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR(","));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("Spatial Profile: Phase 2 -> End set _middlePlusOne %@"), v22);

      v4 = 0;
      v18 = &unk_1EA2B4EC8;
    }
    else
    {
      v17 = fabs(v6);
      if (v17 >= 24.0)
      {
        v18 = &unk_1EA2B4EE0;
      }
      else if (v17 >= 18.0)
      {
        v18 = &unk_1EA2B4EF8;
      }
      else if (v17 >= 12.0)
      {
        v18 = &unk_1EA2B4F10;
      }
      else if (v17 >= 6.0)
      {
        v18 = &unk_1EA2B4F28;
      }
      else
      {
        v18 = 0;
      }
    }
    location = 0;
    objc_initWeak(&location, *(id *)(a1 + 40));
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_112;
    v24[3] = &unk_1EA29B5A0;
    v27 = v4;
    objc_copyWeak(&v26, &location);
    v23 = *(void **)(a1 + 48);
    v24[4] = *(_QWORD *)(a1 + 40);
    v28 = v9;
    v29 = v12;
    v25 = v23;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
}

void __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_112(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id WeakRetained;
  void *v6;
  char v7;
  id v8;
  void *v9;
  int *v10;
  void *v11;
  void *v12;
  dispatch_time_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD block[4];
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  __int16 v22;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d-%i"), objc_msgSend(v3, "intValue"), *(unsigned __int8 *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "animatedFaceLayers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  if ((v7 & 1) == 0)
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(v8, "animatedFaceLayers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v4);

    if (*(_BYTE *)(a1 + 56))
      v10 = &OBJC_IVAR___HPSSpatialProfileSingleStepPillContainerView__layerMappingLeft;
    else
      v10 = &OBJC_IVAR___HPSSpatialProfileSingleStepPillContainerView__layerMappingRight;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + *v10), "objectAtIndexedSubscript:", objc_msgSend(v3, "unsignedIntValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 432), "publishedObjectWithName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_time(0, 700000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_2;
    block[3] = &unk_1EA29B578;
    objc_copyWeak(&v21, (id *)(a1 + 48));
    v22 = *(_WORD *)(a1 + 57);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(a1 + 40);
    v18 = v12;
    v19 = v14;
    v20 = v15;
    v16 = v12;
    dispatch_after(v13, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v21);
  }

}

void __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id v9;
  __int16 v10;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "micaView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_3;
  v7[3] = &unk_1EA29B550;
  v10 = *(_WORD *)(a1 + 64);
  objc_copyWeak(&v9, v2);
  v6 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v6;
  objc_msgSend(v4, "setState:onLayer:animated:transitionSpeed:completion:", CFSTR("Max"), v5, 1, v7, 1.0);

  objc_destroyWeak(&v9);
}

uint64_t __89__HPSSpatialProfileSingleStepPillContainerView_animateFaceAnglesIfneeded_withCompletion___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  _BOOL8 v2;
  id WeakRetained;
  _BOOL8 v4;
  id v5;
  id v6;
  id v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;

  v1 = result;
  if (*(_BYTE *)(result + 56) || *(_BYTE *)(result + 57))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 464) == *(_QWORD *)(*(_QWORD *)(result + 32) + 472);
    WeakRetained = objc_loadWeakRetained((id *)(result + 48));
    objc_msgSend(WeakRetained, "setRightEarStateComplete:", v2);

    v4 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 456) == *(_QWORD *)(*(_QWORD *)(v1 + 32) + 472);
    v5 = objc_loadWeakRetained((id *)(v1 + 48));
    objc_msgSend(v5, "setLeftEarStateComplete:", v4);

    v6 = objc_loadWeakRetained((id *)(v1 + 48));
    LODWORD(v5) = objc_msgSend(v6, "rightEarStateComplete");
    v7 = objc_loadWeakRetained((id *)(v1 + 48));
    v8 = objc_msgSend(v7, "leftEarStateComplete");
    v9 = objc_loadWeakRetained((id *)(v1 + 48));
    objc_msgSend(v9, "pillsStatusArray");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Spatial Profile: Phase 2 -> End, enrollment leftEarStateComplete:%i, rightEarStateComplete:%i, pillsStatusArray:%@"), v5, v8, v11);

    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

- (BOOL)leftSectionCompleted
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v3 = -[HPSSpatialProfileSingleStepPillContainerView leftEarStateComplete](self, "leftEarStateComplete");
  -[HPSSpatialProfileSingleStepPillContainerView pillsStatusArray](self, "pillsStatusArray");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("Spatial Profile: Phase 2 -> End leftEarStateComplete:%i, pillsStatusArray:%@"), v3, v5);

  -[HPSSpatialProfileSingleStepPillContainerView pillsStatusArray](self, "pillsStatusArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", self->_middleMinusOne);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "BOOLValue"))
    v8 = -[HPSSpatialProfileSingleStepPillContainerView leftEarStateComplete](self, "leftEarStateComplete");
  else
    v8 = 0;

  return v8;
}

- (BOOL)rightSectionCompleted
{
  void *v3;
  void *v4;
  BOOL v5;

  -[HPSSpatialProfileSingleStepPillContainerView pillsStatusArray](self, "pillsStatusArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", self->_middlePlusOne);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "BOOLValue"))
    v5 = -[HPSSpatialProfileSingleStepPillContainerView rightEarStateComplete](self, "rightEarStateComplete");
  else
    v5 = 0;

  return v5;
}

- (NSMutableArray)pillsStatusArray
{
  return self->_pillsStatusArray;
}

- (void)setPillsStatusArray:(id)a3
{
  objc_storeStrong((id *)&self->_pillsStatusArray, a3);
}

- (BSUICAPackageView)micaView
{
  return self->_micaView;
}

- (void)setMicaView:(id)a3
{
  objc_storeStrong((id *)&self->_micaView, a3);
}

- (NSArray)layerMappingLeft
{
  return self->_layerMappingLeft;
}

- (void)setLayerMappingLeft:(id)a3
{
  objc_storeStrong((id *)&self->_layerMappingLeft, a3);
}

- (NSArray)layerMappingRight
{
  return self->_layerMappingRight;
}

- (void)setLayerMappingRight:(id)a3
{
  objc_storeStrong((id *)&self->_layerMappingRight, a3);
}

- (unint64_t)leftPillIndex
{
  return self->_leftPillIndex;
}

- (void)setLeftPillIndex:(unint64_t)a3
{
  self->_leftPillIndex = a3;
}

- (unint64_t)rightPillIndex
{
  return self->_rightPillIndex;
}

- (void)setRightPillIndex:(unint64_t)a3
{
  self->_rightPillIndex = a3;
}

- (unint64_t)middleZero
{
  return self->_middleZero;
}

- (void)setMiddleZero:(unint64_t)a3
{
  self->_middleZero = a3;
}

- (unint64_t)middleMinusOne
{
  return self->_middleMinusOne;
}

- (void)setMiddleMinusOne:(unint64_t)a3
{
  self->_middleMinusOne = a3;
}

- (unint64_t)middlePlusOne
{
  return self->_middlePlusOne;
}

- (void)setMiddlePlusOne:(unint64_t)a3
{
  self->_middlePlusOne = a3;
}

- (NSMutableSet)animatedFaceLayers
{
  return self->_animatedFaceLayers;
}

- (void)setAnimatedFaceLayers:(id)a3
{
  objc_storeStrong((id *)&self->_animatedFaceLayers, a3);
}

- (BOOL)rightEarStateComplete
{
  return self->_rightEarStateComplete;
}

- (void)setRightEarStateComplete:(BOOL)a3
{
  self->_rightEarStateComplete = a3;
}

- (BOOL)leftEarStateComplete
{
  return self->_leftEarStateComplete;
}

- (void)setLeftEarStateComplete:(BOOL)a3
{
  self->_leftEarStateComplete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedFaceLayers, 0);
  objc_storeStrong((id *)&self->_layerMappingRight, 0);
  objc_storeStrong((id *)&self->_layerMappingLeft, 0);
  objc_storeStrong((id *)&self->_micaView, 0);
  objc_storeStrong((id *)&self->_pillsStatusArray, 0);
}

@end
