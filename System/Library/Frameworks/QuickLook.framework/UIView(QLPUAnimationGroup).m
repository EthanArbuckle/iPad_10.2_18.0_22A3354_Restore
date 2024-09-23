@implementation UIView(QLPUAnimationGroup)

+ (void)qlpu_animateViews:()QLPUAnimationGroup withDuration:delay:options:animations:completion:
{
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;
  uint64_t v20;

  v14 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __97__UIView_QLPUAnimationGroup__qlpu_animateViews_withDuration_delay_options_animations_completion___block_invoke;
  v16[3] = &unk_24C7265A8;
  v18 = a2;
  v19 = a3;
  v20 = a6;
  v17 = v14;
  v15 = v14;
  objc_msgSend(a1, "_qlpu_animateViews:withAnimationBlock:completionHandler:", a5, v16, a8);

}

+ (void)qlpu_animateViews:()QLPUAnimationGroup withDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:
{
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;

  v18 = a9;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __142__UIView_QLPUAnimationGroup__qlpu_animateViews_withDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion___block_invoke;
  v20[3] = &unk_24C7265D0;
  v22 = a2;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a8;
  v21 = v18;
  v19 = v18;
  objc_msgSend(a1, "_qlpu_animateViews:withAnimationBlock:completionHandler:", a7, v20, a10);

}

+ (void)qlpu_animateViews:()QLPUAnimationGroup usingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:
{
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  double v18;
  double v19;
  uint64_t v20;

  v14 = a7;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __134__UIView_QLPUAnimationGroup__qlpu_animateViews_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_animations_completion___block_invoke;
  v16[3] = &unk_24C7265A8;
  v18 = a2;
  v19 = a3;
  v20 = a6;
  v17 = v14;
  v15 = v14;
  objc_msgSend(a1, "_qlpu_animateViews:withAnimationBlock:completionHandler:", a5, v16, a8);

}

+ (void)qlpu_animateViews:()QLPUAnimationGroup usingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:
{
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  double v26;
  double v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v22 = a11;
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __147__UIView_QLPUAnimationGroup__qlpu_animateViews_usingSpringWithDuration_delay_options_mass_stiffness_damping_initialVelocity_animations_completion___block_invoke;
  v24[3] = &unk_24C7265F8;
  v26 = a2;
  v27 = a3;
  v28 = a10;
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v32 = a7;
  v25 = v22;
  v23 = v22;
  objc_msgSend(a1, "_qlpu_animateViews:withAnimationBlock:completionHandler:", a9, v24, a12);

}

+ (void)_qlpu_animateViews:()QLPUAnimationGroup withAnimationBlock:completionHandler:
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  QLPULayerAnimationGroup *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  void *v35;
  QLPULayerAnimation *v36;
  QLPULayerAnimationGroup *v37;
  void *v38;
  id v39;
  void (**v40)(id, _QWORD *);
  id obj;
  id obja;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  QLPULayerAnimationGroup *v59;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v40 = a4;
  v39 = a5;
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = objc_claimAutoreleasedReturnValue();

  v38 = (void *)v9;
  v37 = -[QLPULayerAnimationGroup initWithReferenceLayer:]([QLPULayerAnimationGroup alloc], "initWithReferenceLayer:", v9);
  +[QLPUAnimationGroup pushAnimationGroup:](QLPUAnimationGroup, "pushAnimationGroup:");
  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v7;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v45)
  {
    v43 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v67 != v43)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v11, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "animationKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "count"))
        {
          v48 = v11;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v15 = v13;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v63;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v63 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
                objc_msgSend(v12, "animationForKey:", v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                if (v21)
                  objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v20);

              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
            }
            while (v17);
          }

          objc_msgSend(v47, "setObject:forKey:", v14, v48);
        }

      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v45);
  }

  v22 = MEMORY[0x24BDAC760];
  if (v39)
  {
    v60[0] = MEMORY[0x24BDAC760];
    v60[1] = 3221225472;
    v60[2] = __86__UIView_QLPUAnimationGroup___qlpu_animateViews_withAnimationBlock_completionHandler___block_invoke;
    v60[3] = &unk_24C725870;
    v61 = v39;
    -[QLPUAnimationGroup setCompletionHandler:](v37, "setCompletionHandler:", v60);

  }
  v58[0] = v22;
  v58[1] = 3221225472;
  v58[2] = __86__UIView_QLPUAnimationGroup___qlpu_animateViews_withAnimationBlock_completionHandler___block_invoke_2;
  v58[3] = &unk_24C724B28;
  v23 = v37;
  v59 = v23;
  v40[2](v40, v58);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obja = obj;
  v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
  if (v46)
  {
    v44 = *(_QWORD *)v55;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v55 != v44)
          objc_enumerationMutation(obja);
        v49 = v24;
        v25 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v24);
        objc_msgSend(v25, "layer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectForKey:", v25);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend(v26, "animationKeys");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
        if (v29)
        {
          v30 = v29;
          v31 = *(_QWORD *)v51;
          do
          {
            for (k = 0; k != v30; ++k)
            {
              if (*(_QWORD *)v51 != v31)
                objc_enumerationMutation(v28);
              v33 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k);
              objc_msgSend(v27, "objectForKeyedSubscript:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "animationForKey:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              if (v35 != v34)
              {
                v36 = -[QLPULayerAnimation initWithLayer:key:]([QLPULayerAnimation alloc], "initWithLayer:key:", v26, v33);
                -[QLPUAnimationGroup addSubAnimationGroup:](v23, "addSubAnimationGroup:", v36);

              }
            }
            v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v50, v70, 16);
          }
          while (v30);
        }

        v24 = v49 + 1;
      }
      while (v49 + 1 != v46);
      v46 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v54, v71, 16);
    }
    while (v46);
  }

  +[QLPUAnimationGroup popAnimationGroup:](QLPUAnimationGroup, "popAnimationGroup:", v23);
}

- (id)_qlpu_animationDictionary
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "layer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "animationKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v1, "animationForKey:", v9, (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

@end
