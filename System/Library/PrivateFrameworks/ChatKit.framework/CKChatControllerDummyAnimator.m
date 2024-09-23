@implementation CKChatControllerDummyAnimator

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  NSObject *v4;
  NSObject *v5;

  -[CKChatControllerDummyAnimator throwAnimationGroup](self, "throwAnimationGroup", a3, a4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    dispatch_group_leave(v4);
    v4 = v5;
  }

}

- (void)stopAnimationWithSendAnimationContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t m;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t n;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CKChatControllerDummyAnimator *v62;
  void *v63;
  id obj;
  id obja;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "impactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v62 = self;
    v63 = v4;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    objc_msgSend(v4, "animatableViews");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
    if (v6)
    {
      v7 = v6;
      v84 = *(_QWORD *)v111;
      v82 = *MEMORY[0x1E0CD3048];
      v78 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v80 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v74 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v76 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v70 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v72 = *MEMORY[0x1E0CD2610];
      v66 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v68 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v111 != v84)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "layer");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "presentationLayer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "valueForKey:", CFSTR("transform"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setFromValue:", v13);

          v106 = v80;
          v107 = v78;
          v108 = v76;
          v109 = v74;
          v102 = v72;
          v103 = v70;
          v104 = v68;
          v105 = v66;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v102);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setToValue:", v14);

          objc_msgSend(v10, "setDuration:", 0.2);
          objc_msgSend(v10, "setAdditive:", 1);
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v82);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setTimingFunction:", v15);

          objc_msgSend(v9, "layer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setAllowsEdgeAntialiasing:", 0);

          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v17 = objc_msgSend(&unk_1E286FC28, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v99;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v99 != v19)
                  objc_enumerationMutation(&unk_1E286FC28);
                v21 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * j);
                objc_msgSend(v9, "layer");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "removeAnimationForKey:", v21);

              }
              v18 = objc_msgSend(&unk_1E286FC28, "countByEnumeratingWithState:objects:count:", &v98, v117, 16);
            }
            while (v18);
          }
          objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("finish"));

        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v118, 16);
      }
      while (v7);
    }

    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(v63, "throwBalloonViews");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
    if (v23)
    {
      v24 = v23;
      v85 = *(_QWORD *)v95;
      v81 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
      v83 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
      v77 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
      v79 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
      v73 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
      v75 = *MEMORY[0x1E0CD2610];
      v69 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
      v71 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
      v67 = *MEMORY[0x1E0CD3048];
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v95 != v85)
            objc_enumerationMutation(obja);
          v26 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "layer");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "presentationLayer");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "valueForKey:", CFSTR("transform"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setFromValue:", v30);

          v106 = v83;
          v107 = v81;
          v108 = v79;
          v109 = v77;
          v102 = v75;
          v103 = v73;
          v104 = v71;
          v105 = v69;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v102);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setToValue:", v31);

          objc_msgSend(v27, "setDuration:", 0.2);
          objc_msgSend(v27, "setAdditive:", 1);
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v67);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setTimingFunction:", v32);

          objc_msgSend(v26, "layer");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setAllowsEdgeAntialiasing:", 0);

          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v34 = objc_msgSend(&unk_1E286FC40, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v91;
            do
            {
              for (m = 0; m != v35; ++m)
              {
                if (*(_QWORD *)v91 != v36)
                  objc_enumerationMutation(&unk_1E286FC40);
                v38 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * m);
                objc_msgSend(v26, "layer");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "removeAnimationForKey:", v38);

              }
              v35 = objc_msgSend(&unk_1E286FC40, "countByEnumeratingWithState:objects:count:", &v90, v115, 16);
            }
            while (v35);
          }
          objc_msgSend(v26, "addAnimation:forKey:", v27, CFSTR("finish"));

        }
        v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v94, v116, 16);
      }
      while (v24);
    }

    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    objc_msgSend(v63, "animatableTextViews");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v86, v114, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v87;
      v44 = *MEMORY[0x1E0CD2DF0];
      do
      {
        for (n = 0; n != v42; ++n)
        {
          if (*(_QWORD *)v87 != v43)
            objc_enumerationMutation(v40);
          v46 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v46, "subviews");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "count");

            if (v48)
            {
              objc_msgSend(v46, "subviews");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v49, "firstObject");
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v46, "subviews");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "firstObject");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "setContentScaleFactor:", 0.0);

              objc_msgSend(v50, "layer");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "setMinificationFilter:", v44);

              objc_msgSend(v50, "layer");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v54, "removeAnimationForKey:", CFSTR("darken"));

            }
            objc_msgSend(v46, "layer");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "removeAnimationForKey:", CFSTR("position.y"));

            objc_msgSend(v46, "layer");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "removeAnimationForKey:", CFSTR("position.x"));

            objc_msgSend(v46, "layer");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "removeAnimationForKey:", CFSTR("transform.scale"));

            objc_msgSend(v46, "layer");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "removeAnimationForKey:", CFSTR("transform.rotation.z"));

            objc_msgSend(v46, "layer");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "removeAnimationForKey:", CFSTR("opacity"));

          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v86, v114, 16);
      }
      while (v42);
    }

    -[CKChatControllerDummyAnimator dustEmitter](v62, "dustEmitter");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v63;
    if (v60)
    {
      -[CKChatControllerDummyAnimator dustEmitter](v62, "dustEmitter");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "removeFromSuperlayer");

      -[CKChatControllerDummyAnimator setDustEmitter:](v62, "setDustEmitter:", 0);
    }
  }

}

- (void)_prepareToAnimateForSendAnimationContext:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CKChatControllerDummyAnimator animationDelegate](self, "animationDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatControllerDummyAnimator stopAnimationWithSendAnimationContext:](self, "stopAnimationWithSendAnimationContext:", v5);
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "animationWillBeginWithContext:", v5);

}

- (id)_animationCompletionBlockWithSendAnimationContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD aBlock[4];
  id v14;
  CKChatControllerDummyAnimator *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "impactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatControllerDummyAnimator animationDelegate](self, "animationDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__CKChatControllerDummyAnimator__animationCompletionBlockWithSendAnimationContext___block_invoke;
  aBlock[3] = &unk_1E274A0B8;
  v7 = v4;
  v14 = v7;
  v15 = self;
  v8 = v6;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.pop"));
  if ((objc_msgSend(v7, "shouldRepeat") & 1) == 0 && v5 && (v10 & 1) == 0)
    objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v9);
  v11 = _Block_copy(v9);

  return v11;
}

void __83__CKChatControllerDummyAnimator__animationCompletionBlockWithSendAnimationContext___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(a1[4], "throwBalloonViews");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
    goto LABEL_3;
  objc_msgSend(v6, "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", CFSTR("finish"));

  if ((v5 & 1) == 0)
LABEL_3:
    objc_msgSend(a1[5], "stopAnimationWithSendAnimationContext:", a1[4]);
  objc_msgSend(a1[6], "animationDidFinishWithContext:", a1[4]);

}

- (void)beginAnimationWithSendAnimationContext:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  -[CKChatControllerDummyAnimator _prepareToAnimateForSendAnimationContext:](self, "_prepareToAnimateForSendAnimationContext:", v7);
  -[CKChatControllerDummyAnimator _animationCompletionBlockWithSendAnimationContext:](self, "_animationCompletionBlockWithSendAnimationContext:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "impactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.impact")))
  {
    -[CKChatControllerDummyAnimator _beginImpactAnimationWithContext:](self, "_beginImpactAnimationWithContext:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.gentle")))
  {
    -[CKChatControllerDummyAnimator _beginGentleAnimationWithContext:](self, "_beginGentleAnimationWithContext:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.loud")))
  {
    -[CKChatControllerDummyAnimator _beginLoudAnimationsWithContext:](self, "_beginLoudAnimationsWithContext:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.focus")))
  {
    -[CKChatControllerDummyAnimator _beginFocusAnimationWithContext:](self, "_beginFocusAnimationWithContext:", v7);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.pop")))
  {
    -[CKChatControllerDummyAnimator setPopAnimationCompletionBlock:](self, "setPopAnimationCompletionBlock:", v4);
    -[CKChatControllerDummyAnimator _beginPopAnimationWithContext:](self, "_beginPopAnimationWithContext:", v7);
  }
  else if (!v5)
  {
    v6 = dispatch_group_create();
    -[CKChatControllerDummyAnimator setThrowAnimationGroup:](self, "setThrowAnimationGroup:", v6);
    -[CKChatControllerDummyAnimator _beginThrowAnimationWithContext:](self, "_beginThrowAnimationWithContext:", v7);
    dispatch_group_notify(v6, MEMORY[0x1E0C80D38], v4);

  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (void)beginQuickReplyAnimationWithSendAnimationContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *group;

  v4 = a3;
  -[CKChatControllerDummyAnimator _prepareToAnimateForSendAnimationContext:](self, "_prepareToAnimateForSendAnimationContext:", v4);
  group = dispatch_group_create();
  -[CKChatControllerDummyAnimator _configureQuickReplySendAnimationGroup:withSendAnimationContext:](self, "_configureQuickReplySendAnimationGroup:withSendAnimationContext:", group, v4);
  -[CKChatControllerDummyAnimator _animationCompletionBlockWithSendAnimationContext:](self, "_animationCompletionBlockWithSendAnimationContext:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_notify(group, MEMORY[0x1E0C80D38], v5);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (double)_throwAnimationDurationScaleFactorForThrownBalloonAttributes:(id)a3 finalBalloonFrames:(id)a4
{
  id v5;
  id v6;
  id v7;
  double v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0x3FF0000000000000;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __113__CKChatControllerDummyAnimator__throwAnimationDurationScaleFactorForThrownBalloonAttributes_finalBalloonFrames___block_invoke;
  v10[3] = &unk_1E2755CB8;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __113__CKChatControllerDummyAnimator__throwAnimationDurationScaleFactorForThrownBalloonAttributes_finalBalloonFrames___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double Width;
  void *v28;
  double v29;
  id v30;
  CGRect v31;
  CGRect v32;

  v30 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v30;
  if (v7 != v30)
  {
    objc_msgSend(v30, "throwBalloonView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v9, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "CGRectValue");
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;

      v31.origin.x = v20;
      v31.origin.y = v22;
      v31.size.width = v24;
      v31.size.height = v26;
      Width = CGRectGetWidth(v31);
      v32.origin.x = v11;
      v32.origin.y = v13;
      v32.size.width = v15;
      v32.size.height = v17;
      if (Width > CGRectGetWidth(v32) * 0.66)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "sendAnimationDuration");
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0.35 / v29;

        *a4 = 1;
      }
    }

    v8 = v30;
  }

}

- (void)_beginThrowAnimationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  CKChatControllerDummyAnimator *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  objc_msgSend(v4, "framesOfAddedChatItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatControllerDummyAnimator throwAnimationGroup](self, "throwAnimationGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "throwBalloonViewAttributesCollection");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CKChatControllerDummyAnimator _throwAnimationDurationScaleFactorForThrownBalloonAttributes:finalBalloonFrames:](self, "_throwAnimationDurationScaleFactorForThrownBalloonAttributes:finalBalloonFrames:", v10, v5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__CKChatControllerDummyAnimator__beginThrowAnimationWithContext___block_invoke;
  v11[3] = &unk_1E2759848;
  v15 = v7;
  v12 = v5;
  v13 = self;
  v14 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v11);

}

void __65__CKChatControllerDummyAnimator__beginThrowAnimationWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  char isKindOfClass;
  char v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double Width;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  double MinX;
  void *v80;
  double v81;
  double v82;
  double MinY;
  void *v84;
  double v85;
  double v86;
  double MaxX;
  void *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  double v122;
  void *v123;
  void *v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  id v129;
  void *v130;
  double v131;
  void *v132;
  double v133;
  float v134;
  void *v135;
  void *v136;
  double v137;
  double v138;
  double v139;
  double v140;
  void *v141;
  void *v142;
  void *v143;
  double v144;
  double v145;
  double v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  char v157;
  void *v158;
  void *v159;
  void *v160;
  int v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  double v166;
  CGFloat v167;
  double v168;
  CGFloat v169;
  double v170;
  CGFloat v171;
  double v172;
  CGFloat v173;
  double v174;
  double v175;
  void *v176;
  double v177;
  void *v178;
  double v179;
  double v180;
  double v181;
  double v182;
  void *v183;
  void *v184;
  void *v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double v192;
  double v193;
  double v194;
  void *v195;
  CGFloat x;
  CGFloat y;
  double v198;
  double height;
  double v200;
  void *v201;
  double v202;
  double v203;
  double v204;
  void *v205;
  double v206;
  double v207;
  double v208;
  void *v209;
  double v210;
  double v211;
  double v212;
  double v213;
  void *v214;
  double v215;
  double v216;
  double v217;
  void *v218;
  uint64_t v219;
  double v220;
  double v221;
  double v222;
  double v223;
  void *v224;
  void *v225;
  CGFloat v226;
  double v227;
  void *v228;
  double v229;
  double v230;
  double v231;
  double v232;
  void *v233;
  void *v234;
  double v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  double v243;
  double v244;
  double v245;
  double v246;
  void *v247;
  double v248;
  double v249;
  double v250;
  double v251;
  void *v252;
  void *v253;
  double v254;
  void *v255;
  double v256;
  void *v257;
  double rect;
  void *recta;
  double v260;
  char v261;
  void *v262;
  void *v263;
  double v264;
  void *v265;
  double v266;
  double v267;
  uint64_t v268;
  double v269;
  CGFloat v270;
  void *v271;
  void *v272;
  double v273;
  void *v274;
  double v275;
  double v276;
  CGFloat v277;
  CGFloat v278;
  uint64_t v279;
  CATransform3D v280;
  CATransform3D v281;
  CATransform3D v282;
  CATransform3D v283;
  CATransform3D v284;
  _QWORD v285[4];
  id v286;
  CGFloat v287;
  CGFloat v288;
  double v289;
  double v290;
  CATransform3D v291;
  CATransform3D v292;
  CATransform3D v293;
  CATransform3D v294;
  CATransform3D v295;
  _QWORD v296[2];
  _QWORD v297[3];
  _QWORD v298[2];
  _QWORD v299[5];
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;
  CGRect v308;
  CGRect v309;
  CGRect v310;
  CGRect v311;
  CGRect v312;
  CGRect v313;
  CGRect v314;
  CGRect v315;
  CGRect v316;
  CGRect v317;
  CGRect v318;
  CGRect v319;
  CGRect v320;
  CGRect v321;
  CGRect v322;
  CGRect v323;

  v299[3] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v5, "throwBalloonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v277 = v9;
    v278 = v8;
    v275 = v10;
    v276 = v11;

    objc_msgSend(v6, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertTime:fromLayer:", 0, CACurrentMediaTime());
    v14 = v13;

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_opt_class();
    v16 = objc_opt_isKindOfClass();
    v17 = (uint64_t *)MEMORY[0x1E0CD2B58];
    v18 = &qword_18E7CC000;
    v19 = &qword_18E7CC000;
    v274 = v5;
    v273 = v14;
    if ((v16 & 1) != 0 || (isKindOfClass & 1) != 0)
    {
      v261 = isKindOfClass;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendAnimationDuration");
      v260 = v21;

      objc_msgSend(v5, "supplementaryViews");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewTextViewContainerView"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewSendButtonSnapshot"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewWhiteTextFadeView"));
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      v262 = v22;
      objc_msgSend(v22, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewAudioMessagePillViewSnapshot"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setHidden:", 0);
      objc_msgSend(v23, "frame");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      objc_msgSend(v24, "position");
      v265 = v24;
      if (v24)
      {
        Width = v34;
        v37 = v35;
      }
      else
      {
        v300.origin.x = v27;
        v300.origin.y = v29;
        v300.size.width = v31;
        v300.size.height = v33;
        Width = CGRectGetWidth(v300);
        v301.origin.x = v27;
        v301.origin.y = v29;
        v301.size.width = v31;
        v301.size.height = v33;
        v37 = CGRectGetHeight(v301) * 0.5;
      }
      v302.origin.x = v27;
      v302.origin.y = v29;
      v302.size.width = v31;
      v302.size.height = v33;
      v38 = Width / CGRectGetWidth(v302);
      v303.origin.x = v27;
      v303.origin.y = v29;
      v303.size.width = v31;
      v303.size.height = v33;
      v39 = v37 / CGRectGetHeight(v303);
      objc_msgSend(v23, "layer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAnchorPoint:", v38, v39);

      objc_msgSend(v6, "frame");
      v42 = v41;
      v44 = v43;
      v267 = v33;
      v270 = v27;
      v46 = v45;
      v47 = v29;
      v49 = v48;
      objc_msgSend(v6, "layer");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setAnchorPoint:", 1.0, 0.5);

      objc_msgSend(v6, "setFrame:", v42, v44, v46, v49);
      objc_msgSend(v272, "frame");
      v52 = v51;
      v54 = v53;
      v56 = v55;
      v58 = v57;
      objc_msgSend(v6, "layer");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "anchorPoint");
      v61 = v60;
      v63 = v62;
      objc_msgSend(v272, "layer");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setAnchorPoint:", v61, v63);

      objc_msgSend(v272, "setFrame:", v52, v54, v56, v58);
      objc_msgSend(v25, "frame");
      v66 = v65;
      v68 = v67;
      v70 = v69;
      v72 = v71;
      objc_msgSend(v6, "layer");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "anchorPoint");
      v75 = v74;
      v77 = v76;
      objc_msgSend(v25, "layer");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "setAnchorPoint:", v75, v77);

      v263 = v25;
      objc_msgSend(v25, "setFrame:", v66, v68, v70, v72);
      v304.origin.x = v270;
      v304.origin.y = v47;
      v304.size.width = v31;
      v304.size.height = v267;
      MinX = CGRectGetMinX(v304);
      objc_msgSend(v23, "layer");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "anchorPoint");
      v82 = v81;
      v305.origin.x = v270;
      v305.origin.y = v47;
      v305.size.width = v31;
      v305.size.height = v267;
      v256 = MinX + v82 * CGRectGetWidth(v305);
      v306.origin.x = v270;
      v306.origin.y = v47;
      v306.size.width = v31;
      v306.size.height = v267;
      MinY = CGRectGetMinY(v306);
      objc_msgSend(v23, "layer");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "anchorPoint");
      v86 = v85;
      v307.origin.x = v270;
      v307.origin.y = v47;
      v307.size.width = v31;
      v307.size.height = v267;
      v254 = MinY + v86 * CGRectGetHeight(v307);

      v308.origin.x = v278;
      v308.origin.y = v277;
      v308.size.width = v275;
      v308.size.height = v276;
      MaxX = CGRectGetMaxX(v308);
      objc_msgSend(v23, "layer");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "anchorPoint");
      v90 = 1.0 - v89;
      v309.origin.x = v270;
      v309.origin.y = v47;
      rect = v31;
      v309.size.width = v31;
      v309.size.height = v267;
      v91 = MaxX - v90 * CGRectGetWidth(v309);
      v310.origin.x = v278;
      v310.origin.y = v277;
      v310.size.width = v275;
      v310.size.height = v276;
      v92 = CGRectGetMinY(v310);
      objc_msgSend(v23, "layer");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "anchorPoint");
      v95 = v94;
      v311.origin.x = v278;
      v311.origin.y = v277;
      v311.size.width = v275;
      v311.size.height = v276;
      v96 = v92 + v95 * CGRectGetHeight(v311);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setBeginTime:", v273);
      objc_msgSend(v97, "setRemovedOnCompletion:", 0);
      v98 = *v17;
      objc_msgSend(v97, "setFillMode:", *v17);
      LODWORD(v99) = 1056629064;
      LODWORD(v100) = 1035276987;
      LODWORD(v101) = 1053793305;
      LODWORD(v102) = 1063767565;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v99, v100, v101, v102);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setTimingFunction:", v103);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v256, v254);
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setFromValue:", v104);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v91, v96);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "setToValue:", v105);

      objc_msgSend(v97, "setDuration:", v260 * *(double *)(a1 + 56));
      objc_msgSend(v97, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "_configureForVFD:", v97);
      if (v23)
      {
        objc_msgSend(v23, "addAnimation:forKey:", v97, CFSTR("position"));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      }
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setBeginTime:", v273);
      v107 = (void *)MEMORY[0x1E0CB3B18];
      CATransform3DMakeScale(&v295, 1.0, 1.0, 1.0);
      objc_msgSend(v107, "valueWithCATransform3D:", &v295);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v299[0] = v108;
      v109 = (void *)MEMORY[0x1E0CB3B18];
      CATransform3DMakeScale(&v294, 0.88, 0.88, 1.0);
      objc_msgSend(v109, "valueWithCATransform3D:", &v294);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v299[1] = v110;
      v111 = (void *)MEMORY[0x1E0CB3B18];
      CATransform3DMakeScale(&v293, 1.0, 1.0, 1.0);
      objc_msgSend(v111, "valueWithCATransform3D:", &v293);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v299[2] = v112;
      v271 = v23;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v299, 3);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setValues:", v113);

      LODWORD(v114) = 1059648963;
      LODWORD(v115) = 0;
      LODWORD(v116) = 1.0;
      LODWORD(v117) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v114, v115, v116, v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v298[0] = v118;
      LODWORD(v119) = 1059022886;
      LODWORD(v120) = 1064176765;
      LODWORD(v121) = 0;
      LODWORD(v122) = 0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v121, v122, v119, v120);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v298[1] = v123;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v298, 2);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setTimingFunctions:", v124);

      objc_msgSend(v106, "setKeyTimes:", &unk_1E286FC58);
      objc_msgSend(v106, "setRemovedOnCompletion:", 0);
      objc_msgSend(v106, "setFillMode:", v98);
      objc_msgSend(v106, "setDuration:", v260 * *(double *)(a1 + 56));
      objc_msgSend(v106, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "_configureForVFD:", v106);
      if (v23)
      {
        objc_msgSend(v23, "addAnimation:forKey:", v106, CFSTR("transform"));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      }
      objc_msgSend(v6, "frame");
      v126 = v125;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v274, "throwBalloonView");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v127, "textView");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = objc_alloc_init(MEMORY[0x1E0CEAB18]);
        objc_msgSend(v128, "attributedText");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "setAttributedText:", v130);

        objc_msgSend(v129, "sizeToFit");
        objc_msgSend(v129, "bounds");
        v126 = CGRectGetWidth(v312);

      }
      v131 = 1.0 - v126 / 303.0 * (v126 / 303.0);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("bounds.size"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "setDuration:", v260 * *(double *)(a1 + 56));
      v133 = 2.0;
      if (v131 >= 1.0)
        v133 = v131 + 1.0;
      v134 = v133;
      *(float *)&v133 = v134;
      objc_msgSend(v132, "setSpeed:", v133);
      objc_msgSend(v132, "setBeginTime:", v273);
      objc_msgSend(v132, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", rect, v267);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "setFromValue:", v135);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v275, v276);
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "setToValue:", v136);

      objc_msgSend(v132, "setFillMode:", v98);
      LODWORD(v137) = 0;
      LODWORD(v138) = 1.0;
      LODWORD(v139) = 1057668432;
      LODWORD(v140) = 1058306785;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v139, v137, v140, v138);
      v141 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "setTimingFunction:", v141);

      objc_msgSend(v132, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "_configureForVFD:", v132);
      objc_msgSend(v6, "layer");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "addAnimation:forKey:", v132, CFSTR("bounds.width"));

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "setBeginTime:", v273);
      objc_msgSend(v143, "setDuration:", *(double *)(a1 + 56) * 0.3);
      objc_msgSend(v143, "setFromValue:", &unk_1E2871760);
      objc_msgSend(v143, "setToValue:", &unk_1E2871740);
      v268 = *MEMORY[0x1E0CD2B60];
      objc_msgSend(v143, "setFillMode:");
      objc_msgSend(v143, "setRemovedOnCompletion:", 0);
      LODWORD(v144) = 0.5;
      LODWORD(v145) = 0;
      LODWORD(v146) = 0.5;
      LODWORD(v147) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v144, v145, v146, v147);
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "setTimingFunction:", v148);

      objc_msgSend(v143, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "_configureForVFD:", v143);
      v149 = v272;
      if (v272 || (v149 = v263) != 0)
      {
        objc_msgSend(v149, "addAnimation:forKey:", v143, CFSTR("opacity"));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        objc_msgSend(v149, "addAnimation:forKey:", v132, CFSTR("bounds.size"));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      }
      objc_msgSend(*(id *)(a1 + 40), "balloonViewFadeInAnimationForConvertedCurrentMediaTime:", v273);
      recta = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addAnimation:forKey:");
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "setBeginTime:", v273);
      objc_msgSend(v150, "setDuration:", *(double *)(a1 + 56) * 0.25);
      v151 = (void *)MEMORY[0x1E0CB3B18];
      CATransform3DMakeScale(&v292, 1.0, 1.0, 1.0);
      objc_msgSend(v151, "valueWithBytes:objCType:", &v292, "{CATransform3D=dddddddddddddddd}");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "setFromValue:", v152);

      v153 = (void *)MEMORY[0x1E0CB3B18];
      CATransform3DMakeScale(&v291, 0.0, 0.0, 1.0);
      objc_msgSend(v153, "valueWithBytes:objCType:", &v291, "{CATransform3D=dddddddddddddddd}");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "setToValue:", v154);

      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "setTimingFunction:", v155);

      objc_msgSend(v150, "setRemovedOnCompletion:", 0);
      objc_msgSend(v150, "setFillMode:", v268);
      objc_msgSend(v150, "setDelegate:", *(_QWORD *)(a1 + 40));
      v156 = v265;
      if (v265)
      {
        objc_msgSend(v265, "addAnimation:forKey:", v150, CFSTR("transform"));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      }
      objc_opt_class();
      v157 = objc_opt_isKindOfClass();
      v17 = (uint64_t *)MEMORY[0x1E0CD2B58];
      if ((v157 & 1) != 0)
      {
        v257 = v97;
        objc_msgSend(v274, "throwBalloonView");
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v158, "textView");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v159, "text");
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        v161 = objc_msgSend(v160, "_isNaturallyRTL");

        v162 = v158;
        if (v161)
        {
          objc_msgSend(v262, "objectForKeyedSubscript:", CFSTR("CKSendAnimationSupplementaryViewWhiteTextFadeViewRTL"));
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v262, "objectForKeyedSubscript:", CFSTR("CKSendAnimationSupplementaryViewBlueTextFadeViewRTL"));
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "textView");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v162, "textView");
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "bounds");
          objc_msgSend(v164, "convertRect:toView:", v271);
          v167 = v166;
          v169 = v168;
          v171 = v170;
          v173 = v172;

          v313.origin.x = v167;
          v313.origin.y = v169;
          v313.size.width = v171;
          v313.size.height = v173;
          v174 = CGRectGetMaxX(v313);
          objc_msgSend(v163, "frame");
          v175 = v174 - CGRectGetMaxX(v314);
          objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.x"));
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "setDuration:", v260 * *(double *)(a1 + 56));
          *(float *)&v177 = v134;
          objc_msgSend(v176, "setSpeed:", v177);
          objc_msgSend(v176, "setBeginTime:", v273);
          objc_msgSend(v176, "setRemovedOnCompletion:", 0);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v175);
          v178 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "setByValue:", v178);

          objc_msgSend(v176, "setFillMode:", v268);
          LODWORD(v179) = 0;
          LODWORD(v180) = 1.0;
          LODWORD(v181) = 1057668432;
          LODWORD(v182) = 1058306785;
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v181, v179, v182, v180);
          v183 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v176, "setTimingFunction:", v183);

          objc_msgSend(v176, "setDelegate:", *(_QWORD *)(a1 + 40));
          objc_msgSend(*(id *)(a1 + 40), "_configureForVFD:", v176);
          if (v163)
          {
            objc_msgSend(v163, "addAnimation:forKey:", v176, CFSTR("position.x"));
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          }
          if (v255)
          {
            objc_msgSend(v255, "addAnimation:forKey:", v176, CFSTR("position.x"));
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
            objc_msgSend(v255, "addAnimation:forKey:", v143, CFSTR("opacity"));
            dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
          }

        }
        v17 = (uint64_t *)MEMORY[0x1E0CD2B58];
        v156 = v265;
        v97 = v257;
      }

      v5 = v274;
      v19 = &qword_18E7CC000;
      v18 = &qword_18E7CC000;
      isKindOfClass = v261;
    }
    if (!(isKindOfClass & 1 | ((objc_msgSend(v6, "isAudioMessage") & 1) == 0)))
    {
      v184 = (void *)MEMORY[0x1E0CEABB0];
      v285[0] = MEMORY[0x1E0C809B0];
      v285[1] = 3221225472;
      v285[2] = __65__CKChatControllerDummyAnimator__beginThrowAnimationWithContext___block_invoke_104;
      v285[3] = &unk_1E274B8B8;
      v286 = v6;
      v287 = v278;
      v288 = v277;
      v289 = v275;
      v290 = v276;
      objc_msgSend(v184, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 0, v285, 0, 0.3, 0.0, 3.0, 500.0, 400.0, 1.0);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v185, "sendAnimationDuration");
      v269 = v186;

      objc_msgSend(v6, "frame");
      v188 = v187;
      v190 = v189;
      v192 = v191;
      v194 = v193;
      objc_msgSend(v6, "layer");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v195, "setAnchorPoint:", 1.0, 0.5);

      objc_msgSend(v6, "setFrame:", v188, v190, v192, v194);
      objc_msgSend(v6, "frame");
      x = v315.origin.x;
      y = v315.origin.y;
      v198 = v315.size.width;
      height = v315.size.height;
      v200 = CGRectGetMinX(v315);
      objc_msgSend(v6, "layer");
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v201, "anchorPoint");
      v203 = v202;
      v316.origin.x = x;
      v316.origin.y = y;
      v316.size.width = v198;
      v316.size.height = height;
      v266 = v200 + v203 * CGRectGetWidth(v316);
      v317.origin.x = x;
      v317.origin.y = y;
      v317.size.width = v198;
      v317.size.height = height;
      v204 = CGRectGetMinY(v317);
      objc_msgSend(v6, "layer");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v205, "anchorPoint");
      v207 = v206;
      v318.origin.x = x;
      v318.origin.y = y;
      v318.size.width = v198;
      v318.size.height = height;
      v264 = v204 + v207 * CGRectGetHeight(v318);

      v319.origin.y = v277;
      v319.origin.x = v278;
      v319.size.width = v275;
      v319.size.height = v276;
      v208 = CGRectGetMaxX(v319);
      objc_msgSend(v6, "layer");
      v209 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v209, "anchorPoint");
      v211 = 1.0 - v210;
      v320.origin.x = x;
      v320.origin.y = y;
      v320.size.width = v198;
      v320.size.height = height;
      v212 = v208 - v211 * CGRectGetWidth(v320);
      v321.origin.x = v278;
      v321.origin.y = v277;
      v321.size.width = v275;
      v321.size.height = v276;
      v213 = CGRectGetMinY(v321);
      objc_msgSend(v6, "layer");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v214, "anchorPoint");
      v216 = v215;
      v322.origin.x = v278;
      v322.origin.y = v277;
      v322.size.width = v275;
      v322.size.height = v276;
      v217 = v213 + v216 * CGRectGetHeight(v322);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.y"));
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "setBeginTime:", v273);
      objc_msgSend(v218, "setRemovedOnCompletion:", 0);
      v219 = *v17;
      objc_msgSend(v218, "setFillMode:", *v17);
      LODWORD(v220) = *((_DWORD *)v18 + 18);
      LODWORD(v221) = 1035276987;
      LODWORD(v222) = 1053793305;
      LODWORD(v223) = 1063767565;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v220, v221, v222, v223);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "setTimingFunction:", v224);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v217 - v264);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v218, "setByValue:", v225);

      objc_msgSend(v218, "setDuration:", v269 * *(double *)(a1 + 56));
      objc_msgSend(v218, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "_configureForVFD:", v218);
      objc_msgSend(v6, "addAnimation:forKey:", v218, CFSTR("position.y"));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      v323.origin.x = v278;
      v323.origin.y = v277;
      v323.size.width = v275;
      v323.size.height = v276;
      v226 = CGRectGetWidth(v323);
      v227 = 1.0 - v226 / 303.0 * (v226 / 303.0);
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.x"));
      v228 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "setBeginTime:", v273);
      objc_msgSend(v228, "setRemovedOnCompletion:", 0);
      v279 = v219;
      objc_msgSend(v228, "setFillMode:", v219);
      LODWORD(v229) = *((_DWORD *)v19 + 24);
      LODWORD(v230) = 1058306785;
      LODWORD(v231) = 0;
      LODWORD(v232) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v229, v231, v230, v232);
      v233 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "setTimingFunction:", v233);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v212 - v266);
      v234 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v228, "setByValue:", v234);

      objc_msgSend(v228, "setDuration:", v269 * *(double *)(a1 + 56));
      v235 = 2.0;
      if (v227 >= 1.0)
        v235 = v227 + 1.0;
      *(float *)&v235 = v235;
      objc_msgSend(v228, "setSpeed:", v235);
      objc_msgSend(v228, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "_configureForVFD:", v228);
      objc_msgSend(v6, "addAnimation:forKey:", v228, CFSTR("position.x"));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "setBeginTime:", v273);
      memset(&v284, 0, sizeof(v284));
      CATransform3DMakeScale(&v284, 1.0, 1.0, 1.0);
      memset(&v283, 0, sizeof(v283));
      CATransform3DMakeScale(&v283, v275 / v198 * 0.88, v276 / height * 0.88, 1.0);
      memset(&v282, 0, sizeof(v282));
      objc_msgSend(v6, "layer");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      v238 = v237;
      if (v237)
        objc_msgSend(v237, "transform");
      else
        memset(&v281, 0, sizeof(v281));
      CATransform3DScale(&v282, &v281, v275 / v198, v276 / height, 1.0);

      v280 = v284;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v280);
      v239 = (void *)objc_claimAutoreleasedReturnValue();
      v297[0] = v239;
      v280 = v283;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v280);
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      v297[1] = v240;
      v280 = v282;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v280);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      v297[2] = v241;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v297, 3);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "setValues:", v242);

      LODWORD(v243) = 1059648963;
      LODWORD(v244) = 0;
      LODWORD(v245) = 1.0;
      LODWORD(v246) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v243, v244, v245, v246);
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      v296[0] = v247;
      LODWORD(v248) = 1059022886;
      LODWORD(v249) = 1064176765;
      LODWORD(v250) = 0;
      LODWORD(v251) = 0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v250, v251, v248, v249);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      v296[1] = v252;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v296, 2);
      v253 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v236, "setTimingFunctions:", v253);

      objc_msgSend(v236, "setKeyTimes:", &unk_1E286FC70);
      objc_msgSend(v236, "setRemovedOnCompletion:", 0);
      objc_msgSend(v236, "setFillMode:", v279);
      objc_msgSend(v236, "setDuration:", v269 * *(double *)(a1 + 56));
      objc_msgSend(v236, "setDelegate:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 40), "_configureForVFD:", v236);
      objc_msgSend(v6, "addAnimation:forKey:", v236, CFSTR("transform"));
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));

      v5 = v274;
    }

  }
}

uint64_t __65__CKChatControllerDummyAnimator__beginThrowAnimationWithContext___block_invoke_104(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_configureQuickReplySendAnimationGroup:(id)a3 withSendAnimationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  -[CKChatControllerDummyAnimator setThrowAnimationGroup:](self, "setThrowAnimationGroup:", v6);
  objc_msgSend(v7, "framesOfAddedChatItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "throwBalloonViewAttributesCollection");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[CKChatControllerDummyAnimator _throwAnimationDurationScaleFactorForThrownBalloonAttributes:finalBalloonFrames:](self, "_throwAnimationDurationScaleFactorForThrownBalloonAttributes:finalBalloonFrames:", v13, v8);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__CKChatControllerDummyAnimator__configureQuickReplySendAnimationGroup_withSendAnimationContext___block_invoke;
  v14[3] = &unk_1E2759870;
  v18 = v9;
  v14[4] = self;
  v15 = v6;
  v16 = v8;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

void __97__CKChatControllerDummyAnimator__configureQuickReplySendAnimationGroup_withSendAnimationContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
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
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  id *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  double v73;
  CGFloat v74;
  double v75;
  CGFloat v76;
  void *v77;
  double v78;
  double v79;
  CGFloat v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  void *v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double Width;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  double MinY;
  void *v100;
  double v101;
  double v102;
  double Height;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  void *v111;
  void *v112;
  void *v113;
  NSObject *v114;
  NSObject *v115;
  double MaxX;
  double v117;
  double v118;
  double v119;
  CGFloat rect;
  dispatch_group_t *rect_8;
  void *rect_16;
  void *rect_24;
  void *v124;
  void *v125;
  void *v126;
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  uint64_t v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;

  v133 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v5, "throwBalloonView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "supplementaryViews");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewTextViewContainerView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewQuickReplySnapshot"));
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewWhiteTextFadeView"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "objectForKey:", CFSTR("CKSendAnimationSupplementaryViewAudioMessagePillViewSnapshot"));
      rect_24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 && v124 && v125)
      {
        objc_msgSend(v124, "superview");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "insertSubview:aboveSubview:", v7, v124);

        objc_msgSend(v7, "setHidden:", 0);
        objc_msgSend(v7, "layer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAnchorPoint:", 0.0, 0.0);

        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "sendAnimationDuration");
        v119 = v11;

        objc_msgSend(v6, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "convertTime:fromLayer:", 0, CACurrentMediaTime());
        v14 = v13;

        objc_msgSend(v6, "frame");
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v22 = v21;
        objc_msgSend(v6, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setAnchorPoint:", 1.0, 0.5);

        objc_msgSend(v6, "setFrame:", v16, v18, v20, v22);
        objc_msgSend(v125, "frame");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        objc_msgSend(v6, "layer");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "anchorPoint");
        v34 = v33;
        v36 = v35;
        objc_msgSend(v125, "layer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setAnchorPoint:", v34, v36);

        objc_msgSend(v125, "setFrame:", v25, v27, v29, v31);
        objc_msgSend(rect_24, "frame");
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;
        objc_msgSend(v6, "layer");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "anchorPoint");
        v48 = v47;
        v50 = v49;
        objc_msgSend(rect_24, "layer");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setAnchorPoint:", v48, v50);

        objc_msgSend(rect_24, "setFrame:", v39, v41, v43, v45);
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_configureForVFD:", v52);
        objc_msgSend(v52, "setBeginTime:", v14);
        objc_msgSend(v52, "setDuration:", *(double *)(a1 + 64) * 0.3);
        objc_msgSend(v52, "setFromValue:", &unk_1E2871760);
        objc_msgSend(v52, "setToValue:", &unk_1E2871740);
        v53 = *MEMORY[0x1E0CD2B60];
        objc_msgSend(v52, "setFillMode:", *MEMORY[0x1E0CD2B60]);
        objc_msgSend(v52, "setRemovedOnCompletion:", 0);
        LODWORD(v54) = 0.5;
        LODWORD(v55) = 0;
        LODWORD(v56) = 0.5;
        LODWORD(v57) = 1.0;
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v54, v55, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "setTimingFunction:", v58);

        objc_msgSend(v52, "setDelegate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v125, "addAnimation:forKey:", v52, CFSTR("opacity"));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        if (rect_24)
        {
          objc_msgSend(rect_24, "addAnimation:forKey:", v52, CFSTR("opacity"));
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        }
        v59 = (id *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 32), "balloonViewFadeInAnimationForConvertedCurrentMediaTime:", v14);
        rect_16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addAnimation:forKey:", rect_16, CFSTR("opacity"));
        rect_8 = (dispatch_group_t *)(a1 + 40);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_configureForVFD:", v60);
        objc_msgSend(rect_16, "beginTime");
        v62 = v61;
        objc_msgSend(rect_16, "duration");
        objc_msgSend(v60, "setBeginTime:", v62 + v63);
        objc_msgSend(v60, "setDuration:", *(double *)(a1 + 64) * 0.5);
        objc_msgSend(v60, "setFromValue:", &unk_1E2871760);
        objc_msgSend(v60, "setToValue:", &unk_1E2871740);
        objc_msgSend(v60, "setFillMode:", v53);
        objc_msgSend(v60, "setRemovedOnCompletion:", 0);
        LODWORD(v64) = 0.5;
        LODWORD(v65) = 0;
        LODWORD(v66) = 0.5;
        LODWORD(v67) = 1.0;
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v64, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "setTimingFunction:", v68);

        objc_msgSend(v60, "setDelegate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v124, "addAnimation:forKey:", v60, CFSTR("opacity"));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        objc_msgSend(v7, "frame");
        v70 = v69;
        v72 = v71;
        v74 = v73;
        v76 = v75;
        objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", a3);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "CGRectValue");
        rect = v78;
        v80 = v79;
        v82 = v81;
        v84 = v83;

        objc_msgSend(*(id *)(a1 + 56), "quickReplySourceRect");
        v118 = v85;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "balloonMaskTailWidth");
        v117 = v87;

        v134.origin.x = rect;
        v134.origin.y = v80;
        v134.size.width = v82;
        v134.size.height = v84;
        MaxX = CGRectGetMaxX(v134);
        objc_msgSend(v7, "layer");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "anchorPoint");
        v90 = v89;
        v135.origin.x = v70;
        v135.origin.y = v72;
        v135.size.width = v74;
        v135.size.height = v76;
        Width = CGRectGetWidth(v135);

        objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position.x"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "beginTime");
        objc_msgSend(v92, "setBeginTime:");
        objc_msgSend(*(id *)(a1 + 32), "_configureForVFD:", v92);
        objc_msgSend(v92, "setDuration:", v119);
        objc_msgSend(v92, "setDamping:", 45.0);
        objc_msgSend(v92, "setStiffness:", 500.0);
        objc_msgSend(v92, "setInitialVelocity:", 0.0);
        objc_msgSend(v92, "setMass:", 1.0);
        v93 = *MEMORY[0x1E0CD2B58];
        objc_msgSend(v92, "setFillMode:", *MEMORY[0x1E0CD2B58]);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setTimingFunction:", v94);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v118 + v117);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setFromValue:", v95);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", MaxX - (1.0 - v90) * Width);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "setToValue:", v96);

        objc_msgSend(v92, "setDelegate:", *(_QWORD *)(a1 + 32));
        objc_msgSend(v92, "setRemovedOnCompletion:", 0);
        objc_msgSend(v7, "addAnimation:forKey:", v92, CFSTR("position.x"));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 56), "quickReplySourceRect");
        v98 = v97;
        v136.origin.x = rect;
        v136.origin.y = v80;
        v136.size.width = v82;
        v136.size.height = v84;
        MinY = CGRectGetMinY(v136);
        objc_msgSend(v7, "layer");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "anchorPoint");
        v102 = v101;
        v137.origin.x = rect;
        v137.origin.y = v80;
        v137.size.width = v82;
        v137.size.height = v84;
        Height = CGRectGetHeight(v137);

        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.y"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = MinY + v102 * Height;
        objc_msgSend(*v59, "_configureForVFD:", v104);
        objc_msgSend(v92, "beginTime");
        v107 = v106;
        objc_msgSend(v92, "duration");
        v109 = v107 + v108 + 0.2;
        v110 = v107 + v108 * 0.25;
        if (vabdd_f64(v105, v98) >= 2.0)
          v110 = v109;
        objc_msgSend(v104, "setBeginTime:", v110);
        objc_msgSend(v104, "setFillMode:", v93);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setTimingFunction:", v111);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v98);
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setFromValue:", v112);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v105);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "setToValue:", v113);

        objc_msgSend(v104, "setDuration:", v119);
        objc_msgSend(v104, "setDelegate:", *v59);
        objc_msgSend(v104, "setRemovedOnCompletion:", 0);
        objc_msgSend(v7, "addAnimation:forKey:", v104, CFSTR("position.y"));
        dispatch_group_enter(*rect_8);

      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v128 = v7;
          v129 = 2112;
          v130 = v124;
          v131 = 2112;
          v132 = v125;
          _os_log_impl(&dword_18DFCD000, v115, OS_LOG_TYPE_INFO, "CKChatControllerDummyAnimator: Unexpectedly nil view - containerThrowBalloonView: %@ quickReplySnapshot: %@ whiteFadeSupplementaryView: %@", buf, 0x20u);
        }

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v114 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v114, OS_LOG_TYPE_INFO, "CKChatControllerDummyAnimator: Unsupported balloon type", buf, 2u);
      }

    }
  }

}

- (id)balloonViewFadeInAnimationForConvertedCurrentMediaTime:(double)a3
{
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatControllerDummyAnimator _configureForVFD:](self, "_configureForVFD:", v5);
  objc_msgSend(v5, "setBeginTime:", a3);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendAnimationDuration");
  objc_msgSend(v5, "setDuration:", v7 / 3.0);

  objc_msgSend(v5, "setFromValue:", &unk_1E2871740);
  objc_msgSend(v5, "setToValue:", &unk_1E2871760);
  objc_msgSend(v5, "setFillMode:", *MEMORY[0x1E0CD2B60]);
  objc_msgSend(v5, "setRemovedOnCompletion:", 0);
  objc_msgSend(v5, "setDelegate:", self);
  return v5;
}

- (void)_beginImpactAnimationWithContext:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  void *v95;
  void *v96;
  double v97;
  double v98;
  double v99;
  double v100;
  void *v101;
  void *v102;
  double v103;
  void *v104;
  void *v105;
  double v106;
  void *v107;
  void *v108;
  double v109;
  double v110;
  id v111;
  id v112;
  void *v113;
  id v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double v120;
  double v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  double v129;
  double v130;
  void *v131;
  double v132;
  void *v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  float v138;
  dispatch_time_t v139;
  void *v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  void *v145;
  double v146;
  uint64_t v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  void *v156;
  void *v157;
  void *v158;
  int v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  _QWORD v164[5];
  char v165;
  _QWORD block[4];
  id v167;
  _OWORD v168[8];
  CATransform3D v169;
  CATransform3D v170;
  CATransform3D v171;
  CATransform3D v172;
  CATransform3D v173;
  CATransform3D v174;
  CATransform3D v175;
  CATransform3D v176;
  CATransform3D v177;
  CATransform3D v178;
  _QWORD v179[2];
  void *v180;
  _QWORD v181[2];
  _QWORD v182[6];
  void *v183;
  _QWORD v184[2];
  _QWORD v185[6];
  _QWORD v186[7];
  _QWORD v187[2];
  _QWORD v188[6];

  v188[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "animatableViews");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animatableTextViews");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwBalloonViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isSender");
  v159 = objc_msgSend(v3, "shouldRepeat");

  v156 = v4;
  objc_msgSend(v4, "firstObject");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsEdgeAntialiasing:", 1);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8 * 5.0;
  objc_msgSend(v163, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRasterizationScale:", v9);

  objc_msgSend(v163, "bounds");
  v12 = -2.0;
  if (v5)
    v12 = 2.0;
  v13 = v11 / v12;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contentsMultiplyColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v162 = v14;
  objc_msgSend(v14, "setFromValue:", objc_msgSend(v15, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v14, "setToValue:", objc_msgSend(v16, "CGColor"));

  objc_msgSend(v14, "setDuration:", 0.25);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.191986218);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v188[0] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0523598776);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v188[1] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v188[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v188, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValues:", v21);

  objc_msgSend(v17, "setKeyTimes:", &unk_1E286FC88);
  LODWORD(v22) = 0;
  LODWORD(v23) = 1.0;
  LODWORD(v24) = 1.0;
  LODWORD(v25) = 1051372203;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v25, v22, v23, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v187[0] = v26;
  LODWORD(v27) = 0;
  LODWORD(v28) = 0;
  LODWORD(v29) = 1.0;
  LODWORD(v30) = 1059760811;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v27, v28, v30, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v187[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v187, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunctions:", v32);

  v161 = v17;
  objc_msgSend(v17, "setAdditive:", 1);
  objc_msgSend(v17, "setDuration:", 0.583333333);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v178, -v13, -0.0, 0.0);
  objc_msgSend(v33, "valueWithCATransform3D:", &v178);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setFromValue:", v34);

  objc_msgSend(v160, "fromValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v160, "setToValue:", v35);

  objc_msgSend(v160, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v177, 3.0, 3.0, 1.0);
  objc_msgSend(v37, "valueWithCATransform3D:", &v177);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v186[0] = v38;
  v39 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v176, 6.9434, 6.9434, 1.0);
  objc_msgSend(v39, "valueWithCATransform3D:", &v176);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v186[1] = v40;
  v41 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v175, 0.92, 0.92, 1.0);
  objc_msgSend(v41, "valueWithCATransform3D:", &v175);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v186[2] = v42;
  v43 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v174, 0.918, 0.918, 1.0);
  objc_msgSend(v43, "valueWithCATransform3D:", &v174);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v186[3] = v44;
  v45 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v173, 1.05, 1.05, 1.0);
  objc_msgSend(v45, "valueWithCATransform3D:", &v173);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v186[4] = v46;
  v47 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v172, 1.05308, 1.05308, 1.0);
  objc_msgSend(v47, "valueWithCATransform3D:", &v172);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v186[5] = v48;
  v49 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v171, 1.0, 1.0, 1.0);
  objc_msgSend(v49, "valueWithCATransform3D:", &v171);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v186[6] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v186, 7);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setValues:", v51);

  objc_msgSend(v36, "setKeyTimes:", &unk_1E286FCA0);
  LODWORD(v52) = 1029517083;
  LODWORD(v53) = 1041529569;
  LODWORD(v54) = 1052099215;
  LODWORD(v55) = 1059447636;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v52, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v185[0] = v56;
  LODWORD(v57) = 1051092582;
  LODWORD(v58) = 1064329806;
  LODWORD(v59) = 1062383649;
  LODWORD(v60) = 0.625;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v60, v57, v58, v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v185[1] = v61;
  LODWORD(v62) = 990057071;
  LODWORD(v63) = 1002740646;
  LODWORD(v64) = 1032268546;
  LODWORD(v65) = 1041932222;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v185[2] = v66;
  LODWORD(v67) = 1044012597;
  LODWORD(v68) = 1034281812;
  LODWORD(v69) = 1060101947;
  LODWORD(v70) = 1063440613;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v67, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v185[3] = v71;
  LODWORD(v72) = 998445679;
  LODWORD(v73) = 1008981770;
  LODWORD(v74) = 1038308344;
  LODWORD(v75) = 1044549468;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v72, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v185[4] = v76;
  LODWORD(v77) = 1055018451;
  LODWORD(v78) = 1039247868;
  LODWORD(v79) = *(_DWORD *)"?5^?";
  LODWORD(v80) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v185[5] = v81;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v185, 6);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setTimingFunctions:", v82);

  objc_msgSend(v36, "setAdditive:", 1);
  objc_msgSend(v36, "setDuration:", 0.666666667);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v170, v13, 0.0, 0.0);
  objc_msgSend(v84, "valueWithCATransform3D:", &v170);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setFromValue:", v85);

  objc_msgSend(v83, "fromValue");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "setToValue:", v86);

  objc_msgSend(v83, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v169, 0.0, 10.0, 0.0);
  objc_msgSend(v88, "valueWithCATransform3D:", &v169);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  v91 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
  v92 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
  v168[5] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v168[6] = v91;
  v168[7] = v92;
  v93 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
  v168[0] = *MEMORY[0x1E0CD2610];
  v168[1] = v93;
  v94 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
  v168[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
  v184[0] = v89;
  v168[3] = v94;
  v168[4] = v90;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", v168);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v184[1] = v95;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 2);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setValues:", v96);

  LODWORD(v97) = 0;
  LODWORD(v98) = 1.0;
  LODWORD(v99) = 1051372203;
  LODWORD(v100) = 1059760811;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v99, v97, v100, v98);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = v101;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v183, 1);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setTimingFunctions:", v102);

  objc_msgSend(v87, "setAdditive:", 1);
  objc_msgSend(v87, "setCalculationMode:", *MEMORY[0x1E0CD2920]);
  objc_msgSend(v87, "setDuration:", 0.333333333);
  v103 = CACurrentMediaTime();
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setBeginTime:", v103);
  objc_msgSend(v104, "setDuration:", 1.5);
  v182[0] = v160;
  v182[1] = v161;
  v153 = v83;
  v154 = v36;
  v182[2] = v36;
  v182[3] = v83;
  v182[4] = v87;
  v182[5] = v162;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v182, 6);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setAnimations:", v105);

  if (v159)
    *(float *)&v106 = INFINITY;
  else
    *(float *)&v106 = 0.0;
  objc_msgSend(v104, "setRepeatCount:", v106);
  objc_msgSend(v163, "layer");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "addAnimation:forKey:", v104, CFSTR("group"));

  objc_msgSend(MEMORY[0x1E0CD2768], "emitterCell");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setContentsScale:", 0.08);
  LODWORD(v109) = *(_DWORD *)"";
  objc_msgSend(v108, "setBirthRate:", v109);
  LODWORD(v110) = 0.5;
  objc_msgSend(v108, "setLifetime:", v110);
  objc_msgSend(v108, "setParticleType:", *MEMORY[0x1E0CD2AF8]);
  objc_msgSend(v108, "setScale:", 1.1);
  objc_msgSend(v108, "setVelocity:", 220.0);
  objc_msgSend(v108, "setVelocityRange:", 180.0);
  objc_msgSend(v108, "setName:", CFSTR("dustCell"));
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.3, 0.0156862745);
  v111 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v108, "setColor:", objc_msgSend(v111, "CGColor"));

  objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("impact-effect-dust"));
  v112 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v108, "setContents:", objc_msgSend(v112, "CGImage"));

  objc_msgSend(v108, "setEmissionRange:", 1.57079633);
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AD0]);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 1.0);
  v114 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v181[0] = objc_msgSend(v114, "CGColor");
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.0);
  v115 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v181[1] = objc_msgSend(v115, "CGColor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v181, 2);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v113, "setValue:forKey:", v116, CFSTR("colors"));

  objc_msgSend(v113, "setValue:forKey:", &unk_1E286FCB8, CFSTR("locations"));
  objc_msgSend(MEMORY[0x1E0CD2760], "behaviorWithType:", *MEMORY[0x1E0CD2AE0]);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setValue:forKey:", CFSTR("scale"), CFSTR("keyPath"));
  objc_msgSend(v117, "setValue:forKey:", &unk_1E286FCD0, CFSTR("values"));
  objc_msgSend(v117, "setValue:forKey:", &unk_1E286FCE8, CFSTR("locations"));
  objc_msgSend(MEMORY[0x1E0CD2770], "layer");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setEmitterShape:", *MEMORY[0x1E0CD2B30]);
  objc_msgSend(v163, "layer");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v119, "bounds");
  v121 = v120 + -20.0;

  objc_msgSend(v163, "layer");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v122, "bounds");
  v124 = v123 + -20.0;

  objc_msgSend(v118, "setEmitterSize:", fmax(v121, 1.0), fmax(v124, 1.0));
  objc_msgSend(v118, "setEmitterMode:", *MEMORY[0x1E0CD2B18]);
  LODWORD(v125) = 4.0;
  objc_msgSend(v118, "setScale:", v125);
  v180 = v108;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v180, 1);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setEmitterCells:", v126);

  objc_msgSend(v163, "layer");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v127, "position");
  objc_msgSend(v118, "setPosition:");

  v179[0] = v113;
  v179[1] = v117;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v179, 2);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "setEmitterBehaviors:", v128);

  objc_msgSend(v104, "duration");
  objc_msgSend(v118, "setDuration:");
  LODWORD(v129) = 2139095040;
  objc_msgSend(v118, "setRepeatCount:", v129);
  objc_msgSend(v104, "duration");
  objc_msgSend(v118, "setBeginTime:", v103 + v130 * 0.21);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("birthRate"));
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "setValues:", &unk_1E286FD00);
  objc_msgSend(v131, "setKeyTimes:", &unk_1E286FD18);
  objc_msgSend(v104, "duration");
  objc_msgSend(v131, "setDuration:");
  objc_msgSend(v131, "setFillMode:", *MEMORY[0x1E0CD2B58]);
  objc_msgSend(v104, "duration");
  objc_msgSend(v131, "setBeginTime:", v132 * -0.21);
  objc_msgSend(v131, "setBeginTimeMode:", *MEMORY[0x1E0CD2918]);
  objc_msgSend(v131, "setRemovedOnCompletion:", 0);
  objc_msgSend(v118, "addAnimation:forKey:", v131, 0);
  objc_msgSend(v163, "superview");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "layer");
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v163, "layer");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v134, "insertSublayer:below:", v118, v135);

  if ((v159 & 1) == 0)
  {
    objc_msgSend(v104, "duration");
    v137 = v136;
    objc_msgSend(v108, "lifetime");
    v139 = dispatch_time(0, (uint64_t)((v138 + v137 * 0.25) * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__CKChatControllerDummyAnimator__beginImpactAnimationWithContext___block_invoke_167;
    block[3] = &unk_1E274A208;
    v167 = v118;
    dispatch_after(v139, MEMORY[0x1E0C80D38], block);

  }
  -[CKChatControllerDummyAnimator setDustEmitter:](self, "setDustEmitter:", v118);

  objc_msgSend(v157, "firstObject");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v140, "subviews");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v141, "count");

    if (v142)
    {
      objc_msgSend(v140, "subviews");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "firstObject");
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "scale");
      objc_msgSend(v144, "setContentScaleFactor:", v146 * 5.0);

      v147 = *MEMORY[0x1E0CD2EF8];
      objc_msgSend(v144, "layer");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "setMinificationFilter:", v147);

      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("contentsMultiplyColor"));
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v150 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v149, "setFromValue:", objc_msgSend(v150, "CGColor"));

      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v151 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v149, "setToValue:", objc_msgSend(v151, "CGColor"));

      objc_msgSend(v149, "setDuration:", 0.25);
      objc_msgSend(v144, "layer");
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v152, "addAnimation:forKey:", v149, CFSTR("darken"));

    }
  }
  v164[0] = MEMORY[0x1E0C809B0];
  v164[1] = 3221225472;
  v164[2] = __66__CKChatControllerDummyAnimator__beginImpactAnimationWithContext___block_invoke_2;
  v164[3] = &__block_descriptor_41_e23_v32__0__UIView_8Q16_B24l;
  *(double *)&v164[4] = v103;
  v165 = v159;
  objc_msgSend(v158, "enumerateObjectsUsingBlock:", v164);

}

uint64_t __66__CKChatControllerDummyAnimator__beginImpactAnimationWithContext___block_invoke_167(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperlayer");
}

void __66__CKChatControllerDummyAnimator__beginImpactAnimationWithContext___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
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
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  CATransform3D v73;
  CATransform3D v74;
  CATransform3D v75;
  CATransform3D v76;
  _BYTE v77[128];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[4];
  _QWORD v81[3];
  _QWORD v82[6];

  v82[4] = *MEMORY[0x1E0C80C00];
  v68 = a2;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v76, 1.0, 1.0, 1.0);
  objc_msgSend(v6, "valueWithCATransform3D:", &v76);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v75, 0.9, 0.9, 1.0);
  objc_msgSend(v8, "valueWithCATransform3D:", &v75);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = v9;
  v10 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v74, 1.1, 1.1, 1.0);
  objc_msgSend(v10, "valueWithCATransform3D:", &v74);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v82[2] = v11;
  v12 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v73, 1.0, 1.0, 1.0);
  objc_msgSend(v12, "valueWithCATransform3D:", &v73);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v82[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValues:", v14);

  objc_msgSend(v5, "setKeyTimes:", &unk_1E286FD30);
  LODWORD(v15) = 0;
  LODWORD(v16) = 0;
  LODWORD(v17) = 1.0;
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v81[0] = v19;
  LODWORD(v20) = 0;
  LODWORD(v21) = 0;
  LODWORD(v22) = 1.0;
  LODWORD(v23) = 1059760811;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v20, v21, v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v81[1] = v24;
  LODWORD(v25) = 0;
  LODWORD(v26) = 1.0;
  LODWORD(v27) = 1.0;
  LODWORD(v28) = 1051372203;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v28, v25, v26, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v29;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunctions:", v30);

  objc_msgSend(v5, "setAdditive:", 1);
  objc_msgSend(v5, "setDuration:", (double)(2 * a3 + 20) / 60.0);
  objc_msgSend(v5, "setBeginTime:", ((double)(2 * a3) + 20.6) / 60.0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setValues:", &unk_1E286FD48);
  v80[0] = &unk_1E2871740;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a3 * -0.01 + 0.26);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v32;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)a3 * -0.02 + 0.5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v33;
  v80[3] = &unk_1E2871760;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setKeyTimes:", v34);

  LODWORD(v35) = 0;
  LODWORD(v36) = 0;
  LODWORD(v37) = 1.0;
  LODWORD(v38) = 1059760811;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v35, v36, v38, v37);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v39;
  LODWORD(v40) = 0;
  LODWORD(v41) = 1.0;
  LODWORD(v42) = 1.0;
  LODWORD(v43) = 1051372203;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v43, v40, v41, v42);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v44;
  LODWORD(v45) = 0;
  LODWORD(v46) = 0;
  LODWORD(v47) = 1.0;
  LODWORD(v48) = 1059760811;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v45, v46, v48, v47);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setTimingFunctions:", v50);

  objc_msgSend(v31, "setAdditive:", 1);
  objc_msgSend(v31, "setDuration:", (double)(6 * a3 + 30) / 60.0);
  objc_msgSend(v31, "setBeginTime:", ((double)a3 * 0.8 + 8.0) / 60.0);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.translation.x"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setValues:", &unk_1E286FD60);
  objc_msgSend(v51, "setKeyTimes:", &unk_1E286FD78);
  objc_msgSend(v51, "setAdditive:", 1);
  objc_msgSend(v51, "setDuration:", 0.133333333);
  objc_msgSend(v51, "setBeginTime:", 0.333333333);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setBeginTime:", *(double *)(a1 + 32));
  v78[0] = v5;
  v78[1] = v31;
  v78[2] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setAnimations:", v53);

  LODWORD(v54) = 2139095040;
  if (!*(_BYTE *)(a1 + 40))
    *(float *)&v54 = 0.0;
  objc_msgSend(v52, "setRepeatCount:", v54);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  objc_msgSend(v52, "animations");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v70 != v58)
          objc_enumerationMutation(v55);
        v60 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        objc_msgSend(v52, "duration");
        v62 = v61;
        objc_msgSend(v60, "beginTime");
        v64 = v63;
        objc_msgSend(v60, "duration");
        v66 = v64 + v65;
        if (v62 >= v66)
          v66 = v62;
        objc_msgSend(v52, "setDuration:", v66);
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    }
    while (v57);
  }

  objc_msgSend(v68, "layer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "addAnimation:forKey:", v52, CFSTR("jump"));

}

- (void)_beginPopAnimationWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CKPopRendererView *v7;
  CKPopRendererView *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
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
  CGAffineTransform v28;
  CGAffineTransform v29;

  v4 = a3;
  objc_msgSend(v4, "throwBalloonViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = [CKPopRendererView alloc];
  v8 = -[CKPopRendererView initWithFrame:device:](v7, "initWithFrame:device:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (-[CKPopRendererView _shouldReverseLayoutDirection](v8, "_shouldReverseLayoutDirection"))
  {
    CGAffineTransformMakeScale(&v29, -1.0, 1.0);
    v28 = v29;
    -[CKPopRendererView setTransform:](v8, "setTransform:", &v28);
  }
  objc_msgSend(v6, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertRect:toView:", v18, v11, v13, v15, v17);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[CKPopRendererView frameForSourceFrame:](v8, "frameForSourceFrame:", v20, v22, v24, v26);
  -[CKPopRendererView setFrame:](v8, "setFrame:");
  -[CKPopRendererView setDelegate:](v8, "setDelegate:", self);
  objc_msgSend(v4, "containerView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "addSubview:", v8);
  if (!-[CKPopRendererView playWithSourceView:](v8, "playWithSourceView:", v6))
    -[CKPopRendererView removeFromSuperview](v8, "removeFromSuperview");

}

- (void)popRendererViewDidBegin:(id)a3
{
  id v3;

  -[CKChatControllerDummyAnimator animationDelegate](self, "animationDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "popAnimationDidBegin");

}

- (void)popRendererViewDidFinish:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CKChatControllerDummyAnimator_popRendererViewDidFinish___block_invoke;
  block[3] = &unk_1E274D388;
  v7 = v4;
  v5 = v4;
  objc_copyWeak(&v8, &location);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __58__CKChatControllerDummyAnimator_popRendererViewDidFinish___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void (**v5)(void);

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "popAnimationCompletionBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();

  if (v5)
    v5[2]();
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "setPopAnimationCompletionBlock:", 0);

}

- (void)popRendererViewPlaySound:(id)a3
{
  id v3;

  -[CKChatControllerDummyAnimator animationDelegate](self, "animationDelegate", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playSoundForPopAnimation");

}

- (void)_beginLoudAnimationsWithContext:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  double v58;
  float v59;
  void *v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  void *v85;
  double v86;
  void *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  void *v92;
  double v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  _QWORD v107[5];
  CATransform3D v108;
  CATransform3D v109;
  CATransform3D v110;
  CATransform3D v111;
  CATransform3D v112;
  CATransform3D v113;
  _QWORD v114[2];
  _QWORD v115[3];
  _QWORD v116[4];
  _QWORD v117[3];
  _QWORD v118[4];
  _QWORD v119[13];

  v119[11] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "throwBalloonViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animatableViews");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animatableTextViews");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_msgSend(v3, "shouldRepeat");
  v5 = objc_msgSend(v3, "isSender");
  v103 = v4;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", 1);

  v104 = v6;
  objc_msgSend(v6, "bounds");
  v9 = -2.0;
  if (v5)
    v9 = 2.0;
  v10 = v8 / v9;
  objc_msgSend(v6, "bounds");
  v12 = v11;
  v13 = v11 * 0.5;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v119[0] = v99;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0698131701);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v119[1] = v98;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0872664626);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v119[2] = v97;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0558505361);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v119[3] = v96;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0523598776);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v119[4] = v15;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0453785606);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v119[5] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0331612558);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v119[6] = v17;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0244346095);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v119[7] = v18;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0174532925);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v119[8] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0174532925);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v119[9] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v119[10] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v119, 11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValues:", v22);

  objc_msgSend(v14, "setKeyTimes:", &unk_1E286FD90);
  v23 = v14;
  objc_msgSend(v14, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v113, -v10, -(v12 * 0.5), 0.0);
  objc_msgSend(v25, "valueWithCATransform3D:", &v113);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFromValue:", v26);

  objc_msgSend(v24, "fromValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setToValue:", v27);

  objc_msgSend(v24, "setAdditive:", 1);
  LODWORD(v27) = objc_msgSend(v3, "beginAnimationFromTranscriptPresentedState");

  if ((_DWORD)v27)
    v28 = 1.0;
  else
    v28 = 0.01;
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v112, v28, v28, 1.0);
  objc_msgSend(v30, "valueWithCATransform3D:", &v112);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v31;
  v32 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v111, 2.25, 2.25, 1.0);
  objc_msgSend(v32, "valueWithCATransform3D:", &v111);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v33;
  v34 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v110, 2.25, 2.25, 1.0);
  objc_msgSend(v34, "valueWithCATransform3D:", &v110);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v118[2] = v35;
  v36 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v109, 1.0, 1.0, 1.0);
  objc_msgSend(v36, "valueWithCATransform3D:", &v109);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v118[3] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v118, 4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setValues:", v38);

  objc_msgSend(v29, "setKeyTimes:", &unk_1E286FDA8);
  LODWORD(v39) = 1051595899;
  LODWORD(v40) = 1049582633;
  LODWORD(v41) = 0;
  LODWORD(v42) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v39, v41, v40, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v43;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v44;
  LODWORD(v45) = 1054280253;
  LODWORD(v46) = 1050924810;
  LODWORD(v47) = 0;
  LODWORD(v48) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v45, v47, v46, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 3);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTimingFunctions:", v50);

  objc_msgSend(v29, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v108, v10, v13, 0.0);
  objc_msgSend(v52, "valueWithCATransform3D:", &v108);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setFromValue:", v53);

  objc_msgSend(v51, "fromValue");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setToValue:", v54);

  objc_msgSend(v51, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *MEMORY[0x1E0CD2950];
  objc_msgSend(v55, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  objc_msgSend(v55, "setDelegate:", self);
  objc_msgSend(v55, "setDuration:", 1.51666667);
  v102 = v23;
  v116[0] = v23;
  v116[1] = v24;
  v116[2] = v29;
  v116[3] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 4);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setAnimations:", v57);

  if (v100)
    v59 = INFINITY;
  else
    v59 = 0.0;
  *(float *)&v58 = v59;
  objc_msgSend(v55, "setRepeatCount:", v58);
  objc_msgSend(v104, "layer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addAnimation:forKey:", v55, CFSTR("group"));

  objc_msgSend(v104, "bounds");
  v107[0] = MEMORY[0x1E0C809B0];
  v107[1] = 3221225472;
  v107[2] = __65__CKChatControllerDummyAnimator__beginLoudAnimationsWithContext___block_invoke_206;
  v107[3] = &__block_descriptor_40_e23_v32__0__UIView_8Q16_B24l;
  *(double *)&v107[4] = v61 * -1.25;
  objc_msgSend(v106, "enumerateObjectsUsingBlock:", v107);
  objc_msgSend(v105, "firstObject");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v62, "bounds");
    v64 = v63 + 10.0;
    objc_msgSend(v62, "bounds");
    v66 = v64 / v65;
    objc_msgSend(v62, "bounds");
    v68 = v67 + 10.0;
    objc_msgSend(v62, "bounds");
    v70 = v68 / v69;
    if (v66 < v68 / v69)
      v70 = v66;
    if (v70 <= 1.15)
      v71 = v70;
    else
      v71 = 1.15;
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = &unk_1E2871760;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v71);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v73;
    v115[2] = &unk_1E2871760;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v115, 3);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setValues:", v74);

    objc_msgSend(v72, "setKeyTimes:", &unk_1E286FDD8);
    LODWORD(v75) = 1045220557;
    LODWORD(v76) = 1048911544;
    LODWORD(v77) = 0;
    LODWORD(v78) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v75, v77, v76, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v79;
    LODWORD(v80) = 0.5;
    LODWORD(v81) = 0;
    LODWORD(v82) = 0.5;
    LODWORD(v83) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v80, v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v84;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 2);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "setTimingFunctions:", v85);

    *(float *)&v86 = v59;
    objc_msgSend(v72, "setRepeatCount:", v86);
    objc_msgSend(v72, "setDuration:", 1.51666667);
    objc_msgSend(v72, "setBeginTimeMode:", v56);
    objc_msgSend(v62, "layer");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "addAnimation:forKey:", v72, CFSTR("transform.scale"));

    objc_msgSend(v62, "subviews");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "count");

    if (v89)
    {
      objc_msgSend(v62, "subviews");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "firstObject");
      v91 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "scale");
      objc_msgSend(v91, "setContentScaleFactor:", v93 * 5.0);

      v94 = *MEMORY[0x1E0CD2EF8];
      objc_msgSend(v91, "layer");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "setMinificationFilter:", v94);

    }
  }

}

void __65__CKChatControllerDummyAnimator__beginLoudAnimationsWithContext___block_invoke_206(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD2798];
  v4 = a2;
  objc_msgSend(v3, "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = &unk_1E2870DE0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  v23[3] = &unk_1E2870DE0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValues:", v8);

  objc_msgSend(v5, "setKeyTimes:", &unk_1E286FDC0);
  objc_msgSend(v5, "setDuration:", 1.5);
  LODWORD(v9) = 1039516303;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v11, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058], v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  LODWORD(v15) = 1040522936;
  LODWORD(v16) = 1051931443;
  LODWORD(v17) = 1053609165;
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunctions:", v20);

  objc_msgSend(v4, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAnimation:forKey:", v5, CFSTR("jump"));
}

- (void)_beginFocusAnimationWithContext:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  double v46;
  float v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[5];
  CATransform3D v83;
  CATransform3D v84;
  CATransform3D v85;
  CATransform3D v86;
  CATransform3D v87;
  CATransform3D v88;
  _QWORD v89[3];
  void *v90;
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[6];

  v93[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "throwBalloonViews");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animatableTextViews");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v3, "shouldRepeat");
  v79 = v3;
  v4 = objc_msgSend(v3, "isSender");
  objc_msgSend(v81, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsEdgeAntialiasing:", 1);

  objc_msgSend(v5, "bounds");
  v8 = -2.0;
  if (v4)
    v8 = 2.0;
  v9 = v7 / v8;
  objc_msgSend(v5, "bounds");
  v11 = v10;
  v12 = v10 * 0.5;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v88, -v9, -(v11 * 0.5), 0.0);
  objc_msgSend(v14, "valueWithCATransform3D:", &v88);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFromValue:", v15);

  objc_msgSend(v13, "fromValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setToValue:", v16);

  objc_msgSend(v13, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v87, 0.1, 0.1, 1.0);
  objc_msgSend(v18, "valueWithCATransform3D:", &v87);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v93[0] = v19;
  v20 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v86, 1.25, 1.25, 1.0);
  objc_msgSend(v20, "valueWithCATransform3D:", &v86);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v21;
  v22 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v85, 1.25, 1.25, 1.0);
  objc_msgSend(v22, "valueWithCATransform3D:", &v85);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v93[2] = v23;
  v24 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v84, 1.0, 1.0, 1.0);
  objc_msgSend(v24, "valueWithCATransform3D:", &v84);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v93[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValues:", v26);

  objc_msgSend(v17, "setKeyTimes:", &unk_1E286FDF0);
  LODWORD(v27) = 0;
  LODWORD(v28) = 0.5;
  LODWORD(v29) = 1.0;
  LODWORD(v30) = 1051931443;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v30, v27, v28, v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v92[0] = v31;
  v74 = *MEMORY[0x1E0CD3058];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = v32;
  LODWORD(v33) = 0;
  LODWORD(v34) = 1.0;
  LODWORD(v35) = 1045220557;
  LODWORD(v36) = 1047233823;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v35, v33, v36, v34);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v92[2] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunctions:", v38);

  objc_msgSend(v17, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v83, v9, v12, 0.0);
  objc_msgSend(v40, "valueWithCATransform3D:", &v83);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setFromValue:", v41);

  objc_msgSend(v39, "fromValue");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setToValue:", v42);

  objc_msgSend(v39, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = *MEMORY[0x1E0CD2950];
  objc_msgSend(v43, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  objc_msgSend(v43, "setDelegate:", self);
  objc_msgSend(v43, "setDuration:", 4.01666667);
  v76 = v13;
  v91[0] = v13;
  v91[1] = v17;
  v91[2] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setAnimations:", v45);

  if (v77)
    v47 = INFINITY;
  else
    v47 = 0.0;
  *(float *)&v46 = v47;
  objc_msgSend(v43, "setRepeatCount:", v46);
  objc_msgSend(v5, "layer");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addAnimation:forKey:", v43, CFSTR("group"));

  v78 = v5;
  objc_msgSend(v5, "bounds");
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v82[2] = __65__CKChatControllerDummyAnimator__beginFocusAnimationWithContext___block_invoke;
  v82[3] = &__block_descriptor_40_e30_v32__0__CKBalloonView_8Q16_B24l;
  *(double *)&v82[4] = v49 * -0.25;
  objc_msgSend(v81, "enumerateObjectsUsingBlock:", v82);
  objc_msgSend(v80, "firstObject");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setValues:", &unk_1E286FE20);
    objc_msgSend(v51, "setKeyTimes:", &unk_1E286FE38);
    LODWORD(v52) = 1047904911;
    LODWORD(v53) = 1043878380;
    LODWORD(v54) = 0;
    LODWORD(v55) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v52, v54, v53, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v90, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setTimingFunctions:", v57);

    *(float *)&v58 = v47;
    objc_msgSend(v51, "setRepeatCount:", v58);
    objc_msgSend(v51, "setDuration:", 4.01666667);
    objc_msgSend(v51, "setBeginTimeMode:", v44);
    objc_msgSend(v50, "layer");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addAnimation:forKey:", v51, CFSTR("transform.scale"));

  }
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setDuration:", 4.01666667);
  objc_msgSend(v60, "setKeyTimes:", &unk_1E286FE50);
  objc_msgSend(v60, "setValues:", &unk_1E286FE68);
  LODWORD(v61) = 0;
  LODWORD(v62) = 0.5;
  LODWORD(v63) = 1.0;
  LODWORD(v64) = 1051931443;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v64, v61, v62, v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = v65;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v74);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v89[1] = v66;
  LODWORD(v67) = 0;
  LODWORD(v68) = 1.0;
  LODWORD(v69) = 1045220557;
  LODWORD(v70) = 1047233823;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v69, v67, v70, v68);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v89[2] = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 3);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setTimingFunctions:", v72);

  objc_msgSend(v79, "backdropLayer");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "addAnimation:forKey:", v60, CFSTR("filters.gaussianBlur.inputRadius"));

}

void __65__CKChatControllerDummyAnimator__beginFocusAnimationWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD2798];
  v4 = a2;
  objc_msgSend(v3, "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = &unk_1E2870DE0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  v23[3] = &unk_1E2870DE0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValues:", v8);

  objc_msgSend(v5, "setKeyTimes:", &unk_1E286FE08);
  objc_msgSend(v5, "setDuration:", 2.3);
  LODWORD(v9) = 1039516303;
  LODWORD(v10) = 0;
  LODWORD(v11) = 0;
  LODWORD(v12) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v11, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058], v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v14;
  LODWORD(v15) = 1040522936;
  LODWORD(v16) = 1051931443;
  LODWORD(v17) = 1053609165;
  LODWORD(v18) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunctions:", v20);

  objc_msgSend(v4, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "addAnimation:forKey:", v5, CFSTR("jump"));
}

- (void)_beginGentleAnimationWithContext:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  double v47;
  float v48;
  void *v49;
  double v50;
  id v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  int v62;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  id v68;
  double v69;
  CATransform3D v70;
  CATransform3D v71;
  CATransform3D v72;
  CATransform3D v73;
  CATransform3D v74;
  CATransform3D v75;
  void *v76;
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[6];

  v79[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "animatableViews");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animatableTextViews");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "throwBalloonViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isSender");
  v62 = objc_msgSend(v3, "shouldRepeat");

  v64 = v4;
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", 1);

  objc_msgSend(v6, "bounds");
  v9 = -2.0;
  if (v5)
    v9 = 2.0;
  v10 = v8 / v9;
  objc_msgSend(v6, "bounds");
  v12 = v11;
  v13 = v11 * 0.5;
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v75, -v10, -(v12 * 0.5), 0.0);
  objc_msgSend(v15, "valueWithCATransform3D:", &v75);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFromValue:", v16);

  objc_msgSend(v14, "fromValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setToValue:", v17);

  objc_msgSend(v14, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v74, 0.1, 0.1, 1.0);
  objc_msgSend(v19, "valueWithCATransform3D:", &v74);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v20;
  v21 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v73, 1.25, 1.25, 1.0);
  objc_msgSend(v21, "valueWithCATransform3D:", &v73);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v22;
  v23 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v72, 1.25, 1.25, 1.0);
  objc_msgSend(v23, "valueWithCATransform3D:", &v72);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v79[2] = v24;
  v25 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeScale(&v71, 1.0, 1.0, 1.0);
  objc_msgSend(v25, "valueWithCATransform3D:", &v71);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v79[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValues:", v27);

  objc_msgSend(v18, "setKeyTimes:", &unk_1E286FE80);
  LODWORD(v28) = 1051931443;
  LODWORD(v29) = 0;
  LODWORD(v30) = 0.5;
  LODWORD(v31) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v32;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v33;
  LODWORD(v34) = 1045220557;
  LODWORD(v35) = 1047233823;
  LODWORD(v36) = 0;
  LODWORD(v37) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v34, v36, v35, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v78[2] = v38;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 3);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimingFunctions:", v39);

  objc_msgSend(v18, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("transform"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)MEMORY[0x1E0CB3B18];
  CATransform3DMakeTranslation(&v70, v10, v13, 0.0);
  objc_msgSend(v41, "valueWithCATransform3D:", &v70);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setFromValue:", v42);

  objc_msgSend(v40, "fromValue");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setToValue:", v43);

  objc_msgSend(v40, "setAdditive:", 1);
  objc_msgSend(MEMORY[0x1E0CD2700], "animation");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x1E0CD2950];
  objc_msgSend(v44, "setBeginTimeMode:", *MEMORY[0x1E0CD2950]);
  objc_msgSend(v44, "setDelegate:", self);
  objc_msgSend(v44, "setDuration:", 4.01666667);
  v77[0] = v14;
  v77[1] = v18;
  v77[2] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAnimations:", v46);

  if (v62)
    v48 = INFINITY;
  else
    v48 = 0.0;
  *(float *)&v47 = v48;
  objc_msgSend(v44, "setRepeatCount:", v47);
  objc_msgSend(v6, "layer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addAnimation:forKey:", v44, CFSTR("group"));

  objc_msgSend(v6, "bounds");
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __66__CKChatControllerDummyAnimator__beginGentleAnimationWithContext___block_invoke;
  v67[3] = &unk_1E27598F8;
  v69 = v50 * -0.25;
  v51 = v18;
  v68 = v51;
  objc_msgSend(v66, "enumerateObjectsUsingBlock:", v67);
  objc_msgSend(v65, "firstObject");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.scale"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setValues:", &unk_1E286FEB0);
    objc_msgSend(v53, "setKeyTimes:", &unk_1E286FEC8);
    LODWORD(v54) = 1047904911;
    LODWORD(v55) = 1043878380;
    LODWORD(v56) = 0;
    LODWORD(v57) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v54, v56, v55, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v76, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setTimingFunctions:", v59);

    *(float *)&v60 = v48;
    objc_msgSend(v53, "setRepeatCount:", v60);
    objc_msgSend(v53, "setDuration:", 4.01666667);
    objc_msgSend(v53, "setBeginTimeMode:", v45);
    objc_msgSend(v52, "layer");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "addAnimation:forKey:", v53, CFSTR("transform.scale"));

  }
}

void __66__CKChatControllerDummyAnimator__beginGentleAnimationWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CD2798];
  v4 = a2;
  objc_msgSend(v3, "animationWithKeyPath:", CFSTR("transform.translation.y"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = &unk_1E2870DE0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  v11[3] = &unk_1E2870DE0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValues:", v8);

  objc_msgSend(v5, "setKeyTimes:", &unk_1E286FE98);
  objc_msgSend(*(id *)(a1 + 32), "duration");
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(*(id *)(a1 + 32), "timingFunctions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunctions:", v9);

  objc_msgSend(v4, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addAnimation:forKey:", v5, CFSTR("jump"));
}

- (void)_configureForVFD:(id)a3
{
  id v3;
  CAFrameRateRange v4;

  v3 = a3;
  v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v3, "setPreferredFrameRateRange:", *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
  objc_msgSend(v3, "setHighFrameRateReason:", 1310722);

}

- (CKSendAnimationManager)animationDelegate
{
  return (CKSendAnimationManager *)objc_loadWeakRetained((id *)&self->_animationDelegate);
}

- (void)setAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_animationDelegate, a3);
}

- (CAEmitterLayer)dustEmitter
{
  return self->_dustEmitter;
}

- (void)setDustEmitter:(id)a3
{
  objc_storeStrong((id *)&self->_dustEmitter, a3);
}

- (OS_dispatch_group)throwAnimationGroup
{
  return self->_throwAnimationGroup;
}

- (void)setThrowAnimationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_throwAnimationGroup, a3);
}

- (id)popAnimationCompletionBlock
{
  return self->_popAnimationCompletionBlock;
}

- (void)setPopAnimationCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_popAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_throwAnimationGroup, 0);
  objc_storeStrong((id *)&self->_dustEmitter, 0);
  objc_destroyWeak((id *)&self->_animationDelegate);
}

@end
