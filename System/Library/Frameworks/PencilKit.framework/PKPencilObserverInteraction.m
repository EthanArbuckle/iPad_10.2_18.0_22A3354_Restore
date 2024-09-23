@implementation PKPencilObserverInteraction

- (_QWORD)initWithDelegate:(_QWORD *)a1
{
  id v3;
  id v4;
  PKPencilStatisticsManager *v5;
  void *v6;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKPencilObserverInteraction;
    v4 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak((id *)v4 + 5, v3);
      v5 = objc_alloc_init(PKPencilStatisticsManager);
      v6 = (void *)a1[7];
      a1[7] = v5;

    }
  }

  return a1;
}

- (void)willMoveToView:(id)a3
{
  void *v4;
  PKPencilObserverGestureRecognizer *pencilObserver;
  PKHoverController *hoverController;

  if (self->_pencilObserver)
  {
    -[PKPencilObserverInteraction view](self, "view", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", self->_pencilObserver);

    pencilObserver = self->_pencilObserver;
    self->_pencilObserver = 0;

  }
  hoverController = self->_hoverController;
  self->_hoverController = 0;

}

- (void)didMoveToView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  -[PKPencilObserverInteraction setView:](self, "setView:", v4);
  if (v4)
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__PKPencilObserverInteraction_didMoveToView___block_invoke;
    v12[3] = &unk_1E7778BF8;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    +[PKHoverSettings checkIfHoverIsSupported:](PKHoverSettings, "checkIfHoverIsSupported:", v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[PKPencilInteraction observerPencilInteraction]();
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setDelegate:", self);
    objc_msgSend(v4, "addInteraction:", WeakRetained);
    objc_storeWeak((id *)&self->_pencilInteraction, WeakRetained);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "windowScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_sceneDidEnterBackground_, *MEMORY[0x1E0DC5318], v10);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pencilInteraction);
    objc_storeWeak((id *)&self->_pencilInteraction, 0);
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeInteraction:", WeakRetained);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x1E0DC5318], 0);
  }

}

void __45__PKPencilObserverInteraction_didMoveToView___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  int64x2_t *v6;
  void *v7;
  int has_internal_diagnostics;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 32);

      if (v4 == v5)
      {
        v6 = -[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], WeakRetained, *(void **)(a1 + 32));
        v7 = (void *)WeakRetained[8];
        WeakRetained[8] = v6;

        has_internal_diagnostics = os_variant_has_internal_diagnostics();
        if (has_internal_diagnostics)
        {
          objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v5, "BOOLForKey:", CFSTR("PKLogHoverEventsInPencilKit"));
        }
        else
        {
          v9 = 0;
        }
        v10 = WeakRetained;
        v11 = WeakRetained[8];
        if (v11)
          *(_BYTE *)(v11 + 428) = v9;
        if (has_internal_diagnostics)
        {

          v10 = WeakRetained;
        }
        +[PKPencilObserverGestureRecognizer pencilObserverWithDelegate:]((uint64_t)PKPencilObserverGestureRecognizer, v10);
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)WeakRetained[9];
        WeakRetained[9] = v12;

        objc_msgSend(*(id *)(a1 + 32), "addGestureRecognizer:", WeakRetained[9]);
      }
    }
  }

}

- (void)createShadowViewIfNecessary
{
  _DWORD *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  if (val)
  {
    if (!*((_QWORD *)val + 6))
      goto LABEL_15;
    +[PKPencilDevice activePencil]();
    v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
    if (v2 && !v2[9])
    {
      v3 = val[33];

      if (!v3)
      {
        v4 = os_log_create("com.apple.pencilkit", "PencilDevice");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Detected unknown roll state. Tearing down shadow view.", (uint8_t *)buf, 2u);
        }

        val[32] = 0;
        objc_msgSend(*((id *)val + 6), "removeFromSuperview");
        v5 = (void *)*((_QWORD *)val + 6);
        *((_QWORD *)val + 6) = 0;

      }
    }
    else
    {

    }
    if (!*((_QWORD *)val + 6))
    {
LABEL_15:
      if (!val[33])
      {
        *((_WORD *)val + 16) = 257;
        objc_initWeak(buf, val);
        +[PKPencilDevice activePencil]();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __58__PKPencilObserverInteraction_createShadowViewIfNecessary__block_invoke;
        v7[3] = &unk_1E7777A98;
        objc_copyWeak(&v8, buf);
        -[PKPencilDevice checkIfRollIsSupported:]((uint64_t)v6, v7);

        objc_destroyWeak(&v8);
        objc_destroyWeak(buf);
      }
    }
  }
}

void __58__PKPencilObserverInteraction_createShadowViewIfNecessary__block_invoke(uint64_t a1, char a2)
{
  _BYTE *WeakRetained;
  void *v4;
  int v5;
  PKPencilShadowView *v6;
  id v7;
  void *v8;
  _BYTE *v9;
  id *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((a2 & 1) != 0)
  {
    if (!WeakRetained)
      goto LABEL_9;
    WeakRetained[33] = 0;
  }
  else
  {
    v9 = WeakRetained;
    +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "toolShadowActiveOnOldPencils");

    WeakRetained = v9;
    if (!v9)
      goto LABEL_9;
    v9[33] = 0;
    if (!v5)
      goto LABEL_9;
  }
  if (WeakRetained[32] && !*((_QWORD *)WeakRetained + 6))
  {
    v10 = (id *)WeakRetained;
    v6 = objc_alloc_init(PKPencilShadowView);
    v7 = v10[6];
    v10[6] = v6;

    objc_msgSend(v10[6], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v10, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v10[6]);

    WeakRetained = v10;
  }
LABEL_9:

}

- (uint64_t)_updatePencilShadowView:(uint64_t)result
{
  uint64_t v2;
  double *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char *v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  double v68;
  double *v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  _OWORD v74[8];

  if (result)
  {
    v2 = result;
    if (*(_QWORD *)(result + 48))
    {
      result = objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", result, sel_hidePencilShadowViewIfNecessary, 0);
      v5 = *(_QWORD *)(v2 + 8);
      v4 = *(double **)(v2 + 16);
      v6 = (unint64_t)v4 - v5;
      if (v4 == (double *)v5 || a2[8] - *(v4 - 8) >= 0.002)
      {
        if (v6 >= 0x481)
        {
          v7 = *(_QWORD *)(v2 + 8);
          do
          {
            v8 = (char *)v4 - v5 - 128;
            if (v4 != (double *)(v5 + 128))
            {
              memmove((void *)v5, (const void *)(v5 + 128), (size_t)v4 - v5 - 128);
              v7 = *(_QWORD *)(v2 + 8);
            }
            v4 = (double *)&v8[v5];
            *(_QWORD *)(v2 + 16) = &v8[v5];
            v6 = (unint64_t)&v8[v5 - v7];
            v5 = v7;
          }
          while (v6 > 0x480);
          v5 = v7;
        }
        v9 = *(_QWORD *)(v2 + 24);
        if ((unint64_t)v4 >= v9)
        {
          v17 = v6 >> 7;
          v18 = (v6 >> 7) + 1;
          v19 = v9 - v5;
          v20 = (uint64_t)(v9 - v5) >> 6;
          if (v20 <= v18)
            v21 = v17 + 1;
          else
            v21 = v20;
          if (v19 >= 0x7FFFFFFFFFFFFF80)
            v22 = 0x1FFFFFFFFFFFFFFLL;
          else
            v22 = v21;
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>(v2 + 24, v22);
          v24 = &v23[128 * v17];
          v26 = &v23[128 * v25];
          v27 = *(_OWORD *)a2;
          v28 = *((_OWORD *)a2 + 1);
          v29 = *((_OWORD *)a2 + 3);
          *((_OWORD *)v24 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)v24 + 3) = v29;
          *(_OWORD *)v24 = v27;
          *((_OWORD *)v24 + 1) = v28;
          v30 = *((_OWORD *)a2 + 4);
          v31 = *((_OWORD *)a2 + 5);
          v32 = *((_OWORD *)a2 + 7);
          *((_OWORD *)v24 + 6) = *((_OWORD *)a2 + 6);
          *((_OWORD *)v24 + 7) = v32;
          *((_OWORD *)v24 + 4) = v30;
          *((_OWORD *)v24 + 5) = v31;
          v16 = v24 + 128;
          v34 = *(char **)(v2 + 8);
          v33 = *(char **)(v2 + 16);
          if (v33 != v34)
          {
            do
            {
              v35 = *((_OWORD *)v33 - 8);
              v36 = *((_OWORD *)v33 - 7);
              v37 = *((_OWORD *)v33 - 5);
              *((_OWORD *)v24 - 6) = *((_OWORD *)v33 - 6);
              *((_OWORD *)v24 - 5) = v37;
              *((_OWORD *)v24 - 8) = v35;
              *((_OWORD *)v24 - 7) = v36;
              v38 = *((_OWORD *)v33 - 4);
              v39 = *((_OWORD *)v33 - 3);
              v40 = *((_OWORD *)v33 - 1);
              *((_OWORD *)v24 - 2) = *((_OWORD *)v33 - 2);
              *((_OWORD *)v24 - 1) = v40;
              *((_OWORD *)v24 - 4) = v38;
              *((_OWORD *)v24 - 3) = v39;
              v24 -= 128;
              v33 -= 128;
            }
            while (v33 != v34);
            v33 = *(char **)(v2 + 8);
          }
          *(_QWORD *)(v2 + 8) = v24;
          *(_QWORD *)(v2 + 16) = v16;
          *(_QWORD *)(v2 + 24) = v26;
          if (v33)
            operator delete(v33);
        }
        else
        {
          v10 = *(_OWORD *)a2;
          v11 = *((_OWORD *)a2 + 1);
          v12 = *((_OWORD *)a2 + 3);
          *((_OWORD *)v4 + 2) = *((_OWORD *)a2 + 2);
          *((_OWORD *)v4 + 3) = v12;
          *(_OWORD *)v4 = v10;
          *((_OWORD *)v4 + 1) = v11;
          v13 = *((_OWORD *)a2 + 4);
          v14 = *((_OWORD *)a2 + 5);
          v15 = *((_OWORD *)a2 + 7);
          *((_OWORD *)v4 + 6) = *((_OWORD *)a2 + 6);
          *((_OWORD *)v4 + 7) = v15;
          *((_OWORD *)v4 + 4) = v13;
          *((_OWORD *)v4 + 5) = v14;
          v16 = v4 + 16;
        }
        *(_QWORD *)(v2 + 16) = v16;
        objc_msgSend(*(id *)(v2 + 48), "setLocation:", *a2, a2[1]);
        v41 = a2[13];
        +[PKPencilDevice activePencil]();
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = -[PKPencilDevice baseRollAngle]((uint64_t)v42) - v41;
        v44 = fmod(v43, 6.28318531);
        if (v43 <= 6.28318531 && v43 >= 0.0)
          v44 = v43;
        if (v44 < 0.0)
          v44 = v44 + 6.28318531;
        if (v44 == 0.0)
          v44 = 0.0;
        objc_msgSend(*(id *)(v2 + 48), "setRollAngle:", v44);

        objc_msgSend(*(id *)(v2 + 48), "setZPosition:", a2[7]);
        objc_msgSend(*(id *)(v2 + 48), "setAzimuth:", a2[3] + 1.57079633);
        objc_msgSend(*(id *)(v2 + 48), "setAltitude:", 1.57079633 - a2[4]);
        objc_msgSend(*(id *)(v2 + 48), "setAccessibilityIdentifier:", CFSTR("ToolShadow"));
        v46 = *(id *)(v2 + 64);
        +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "toolPreviewMaxZDistance");
        v48 = *((_OWORD *)a2 + 5);
        v74[4] = *((_OWORD *)a2 + 4);
        v74[5] = v48;
        v49 = *((_OWORD *)a2 + 7);
        v74[6] = *((_OWORD *)a2 + 6);
        v74[7] = v49;
        v50 = *((_OWORD *)a2 + 1);
        v74[0] = *(_OWORD *)a2;
        v74[1] = v50;
        v51 = *((_OWORD *)a2 + 3);
        v74[2] = *((_OWORD *)a2 + 2);
        v74[3] = v51;
        v53 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)v46, v74, v52);

        +[PKHoverSettings sharedSettings](PKHoverSettings, "sharedSettings");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "toolShadowFadeInDistance");
        v56 = v55;

        if (v53 >= v56)
          v57 = v56;
        else
          v57 = v53;
        v58 = v53 - v57;
        v59 = a2[7];
        v60 = 1.0;
        if (v59 > v53 - v57)
        {
          v61 = v59 - v58;
          if (v59 - v58 >= v57)
            v61 = v57;
          v60 = 1.0 - v61 / v57;
        }
        v62 = *(_QWORD *)(v2 + 8);
        v63 = *(_QWORD *)(v2 + 16) - v62;
        if ((unint64_t)v63 >= 0x500)
        {
          v65 = v63 >> 7;
          v66 = 0.0;
          if (v63 >= 129)
          {
            v67 = 2;
            if (v65 > 2)
              v67 = v65;
            v68 = *(double *)(v62 + 64);
            v69 = (double *)(v62 + 128);
            v70 = v67 - 1;
            do
            {
              v71 = v69[8];
              if (v71 > v68)
                v66 = v66
                    + ((*(v69 - 15) - v69[1]) * (*(v69 - 15) - v69[1]) + (*(v69 - 16) - *v69) * (*(v69 - 16) - *v69))
                    / (v71 - v68);
              v69 += 16;
              v68 = v71;
              --v70;
            }
            while (v70);
          }
          v64 = sqrt(v66) / (double)v65 + -60.0;
        }
        else
        {
          v64 = -60.0;
        }
        v72 = v64 / -50.0;
        v73 = 0.0;
        if (v72 >= 0.0)
        {
          v73 = v72;
          if (v72 > 1.0)
            v73 = 1.0;
        }
        return objc_msgSend(*(id *)(v2 + 48), "setShadowAlphaMultiplier:", v60 * v73);
      }
    }
  }
  return result;
}

+ (id)interactionForScene:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  +[PKTextInputInteraction interactionForScene:](PKTextInputInteraction, "interactionForScene:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pencilObserverInteraction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (uint64_t)isActive
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = a1;
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 64);
    if (v2 && *(_BYTE *)(v2 + 56))
    {
      return 1;
    }
    else
    {
      v3 = *(id *)(a1 + 72);
      v1 = objc_msgSend(v3, "state") == 2 || objc_msgSend(*(id *)(v1 + 72), "state") == 1;

    }
  }
  return v1;
}

- (void)sceneDidEnterBackground:(id)a3
{
  uint64_t v4;
  _DWORD *v5;
  PKPencilShadowView *shadowView;

  +[PKPencilDevice activePencil]();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (_DWORD *)v4;
  if (v4)
  {
    -[PKPencilDevice resetRollSupportedState](v4);
    if (v5[9])
      v5[9] = 0;
  }

  if (self)
  {
    self->_wantsShadowView = 0;
    -[PKPencilShadowView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    shadowView = self->_shadowView;
    self->_shadowView = 0;

  }
  -[PKPencilStatisticsManager endAnalyticsSessionIfNecessary]((uint64_t)self->_statisticsManager);
}

- (uint64_t)_trackHoverInEdgeForInputPoint:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[8];
  _OWORD v19[8];

  if (result)
  {
    v3 = result;
    *(_OWORD *)(result + 120) = *a2;
    v4 = *(_QWORD *)(result + 64);
    v5 = a2[5];
    v19[4] = a2[4];
    v19[5] = v5;
    v6 = a2[7];
    v19[6] = a2[6];
    v19[7] = v6;
    v7 = a2[1];
    v19[0] = *a2;
    v19[1] = v7;
    v8 = a2[3];
    v19[2] = a2[2];
    v19[3] = v8;
    result = -[PKHoverController isInEdgeOfScreen:](v4, v19);
    if ((_DWORD)result)
    {
      v9 = *(_QWORD *)(v3 + 56);
      if (!v9)
        goto LABEL_9;
      v10 = (_QWORD *)(v9 + 56);
    }
    else
    {
      v11 = *(_QWORD *)(v3 + 64);
      v12 = a2[5];
      v18[4] = a2[4];
      v18[5] = v12;
      v13 = a2[7];
      v18[6] = a2[6];
      v18[7] = v13;
      v14 = a2[1];
      v18[0] = *a2;
      v18[1] = v14;
      v15 = a2[3];
      v18[2] = a2[2];
      v18[3] = v15;
      result = -[PKHoverController isInExteriorOfScreen:](v11, v18);
      if (!(_DWORD)result)
        goto LABEL_9;
      v16 = *(_QWORD *)(v3 + 56);
      if (!v16)
        goto LABEL_9;
      v10 = (_QWORD *)(v16 + 64);
    }
    ++*v10;
LABEL_9:
    v17 = *(_QWORD *)(v3 + 56);
    if (v17)
      ++*(_QWORD *)(v17 + 72);
  }
  return result;
}

- (void)_updateActivePencilMinutes
{
  double v2;
  uint64_t v3;

  if (a1)
  {
    v2 = CACurrentMediaTime();
    if (v2 - *(double *)(a1 + 96) >= 60.0)
    {
      v3 = *(_QWORD *)(a1 + 56);
      if (v3)
        ++*(_QWORD *)(v3 + 120);
      *(double *)(a1 + 96) = v2;
    }
  }
}

- (void)hoverController:(id)a3 intentionalHoverWithDuration:(double)a4
{
  PKPencilStatisticsManager *statisticsManager;
  PKRunningStat *value;

  if (self)
  {
    statisticsManager = self->_statisticsManager;
    if (statisticsManager)
    {
      value = statisticsManager->_intentionalHoverStats.__ptr_.__value_;
      if (value)
        PKRunningStat::push(value, a4);
      statisticsManager->_intentionalHoverDuration = statisticsManager->_intentionalHoverDuration + a4;
    }
  }
}

- (void)hoverController:(id)a3 didBegin:(id *)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];
  _OWORD v15[8];

  -[PKPencilStatisticsManager startAnalyticsSessionIfNecessary]((uint64_t)self->_statisticsManager);
  self->_timestampForHoverBegan = CACurrentMediaTime();
  v6 = *(_OWORD *)&a4->var9;
  v15[4] = *(_OWORD *)&a4->var7;
  v15[5] = v6;
  v7 = *(_OWORD *)&a4->var13;
  v15[6] = *(_OWORD *)&a4->var11;
  v15[7] = v7;
  v8 = *(_OWORD *)&a4->var1;
  v15[0] = a4->var0;
  v15[1] = v8;
  v9 = *(_OWORD *)&a4->var5;
  v15[2] = *(_OWORD *)&a4->var3;
  v15[3] = v9;
  -[PKPencilObserverInteraction _trackHoverInEdgeForInputPoint:]((uint64_t)self, v15);
  -[PKPencilObserverInteraction _updateActivePencilMinutes]((uint64_t)self);
  v10 = *(_OWORD *)&a4->var9;
  v14[4] = *(_OWORD *)&a4->var7;
  v14[5] = v10;
  v11 = *(_OWORD *)&a4->var13;
  v14[6] = *(_OWORD *)&a4->var11;
  v14[7] = v11;
  v12 = *(_OWORD *)&a4->var1;
  v14[0] = a4->var0;
  v14[1] = v12;
  v13 = *(_OWORD *)&a4->var5;
  v14[2] = *(_OWORD *)&a4->var3;
  v14[3] = v13;
  -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)self, (double *)v14);
}

- (void)hoverController:(id)a3 didUpdate:(id *)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[8];
  _OWORD v15[8];

  v6 = *(_OWORD *)&a4->var9;
  v15[4] = *(_OWORD *)&a4->var7;
  v15[5] = v6;
  v7 = *(_OWORD *)&a4->var13;
  v15[6] = *(_OWORD *)&a4->var11;
  v15[7] = v7;
  v8 = *(_OWORD *)&a4->var1;
  v15[0] = a4->var0;
  v15[1] = v8;
  v9 = *(_OWORD *)&a4->var5;
  v15[2] = *(_OWORD *)&a4->var3;
  v15[3] = v9;
  -[PKPencilObserverInteraction _trackHoverInEdgeForInputPoint:]((uint64_t)self, v15);
  -[PKPencilObserverInteraction _updateActivePencilMinutes]((uint64_t)self);
  v10 = *(_OWORD *)&a4->var9;
  v14[4] = *(_OWORD *)&a4->var7;
  v14[5] = v10;
  v11 = *(_OWORD *)&a4->var13;
  v14[6] = *(_OWORD *)&a4->var11;
  v14[7] = v11;
  v12 = *(_OWORD *)&a4->var1;
  v14[0] = a4->var0;
  v14[1] = v12;
  v13 = *(_OWORD *)&a4->var5;
  v14[2] = *(_OWORD *)&a4->var3;
  v14[3] = v13;
  -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)self, (double *)v14);
}

- (void)hoverControllerDidEnd:(id)a3
{
  double v4;
  double v5;
  PKPencilStatisticsManager *v6;
  NSObject *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CACurrentMediaTime();
  v5 = v4;
  if (self)
  {
    v5 = v4 - self->_timestampForHoverBegan;
    v6 = self->_statisticsManager;
    if (v6)
      v6->_accumulatedHoverDuration = v5 + v6->_accumulatedHoverDuration;
  }
  else
  {
    v6 = 0;
  }

  v7 = os_log_create("com.apple.pencilkit", "Pencil Observer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Pencil Hover Duration: %.3f", (uint8_t *)&v8, 0xCu);
  }

  -[PKPencilObserverInteraction performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hidePencilShadowViewIfNecessary, 0, 0.0666666667);
}

- (void)pencilObserver:(id)a3 didBeginAtPoint:(id *)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[8];

  -[PKPencilStatisticsManager startAnalyticsSessionIfNecessary]((uint64_t)self->_statisticsManager);
  -[PKPencilObserverInteraction _updateActivePencilMinutes]((uint64_t)self);
  self->_currentLocation = (CGPoint)a4->var0;
  self->_timestampForPencilObserverBegan = CACurrentMediaTime();
  -[PKHoverController didReceiveNormalTouch:]((uint64_t)self->_hoverController, 0);
  v6 = *(_OWORD *)&a4->var9;
  v10[4] = *(_OWORD *)&a4->var7;
  v10[5] = v6;
  v7 = *(_OWORD *)&a4->var13;
  v10[6] = *(_OWORD *)&a4->var11;
  v10[7] = v7;
  v8 = *(_OWORD *)&a4->var1;
  v10[0] = a4->var0;
  v10[1] = v8;
  v9 = *(_OWORD *)&a4->var5;
  v10[2] = *(_OWORD *)&a4->var3;
  v10[3] = v9;
  -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)self, (double *)v10);
}

- (void)pencilObserver:(id)a3 didMoveToPoint:(id *)a4
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[8];

  -[PKPencilObserverInteraction _updateActivePencilMinutes]((uint64_t)self);
  self->_currentLocation = (CGPoint)a4->var0;
  -[PKHoverController didReceiveNormalTouch:]((uint64_t)self->_hoverController, 0);
  v6 = *(_OWORD *)&a4->var9;
  v10[4] = *(_OWORD *)&a4->var7;
  v10[5] = v6;
  v7 = *(_OWORD *)&a4->var13;
  v10[6] = *(_OWORD *)&a4->var11;
  v10[7] = v7;
  v8 = *(_OWORD *)&a4->var1;
  v10[0] = a4->var0;
  v10[1] = v8;
  v9 = *(_OWORD *)&a4->var5;
  v10[2] = *(_OWORD *)&a4->var3;
  v10[3] = v9;
  -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)self, (double *)v10);
}

- (void)pencilObserverDidEnd:(id)a3
{
  double v4;
  double v5;
  PKPencilStatisticsManager *v6;
  NSObject *v7;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = CACurrentMediaTime();
  v5 = v4;
  if (self)
  {
    v5 = v4 - self->_timestampForPencilObserverBegan;
    v6 = self->_statisticsManager;
    if (v6)
      v6->_accumulatedOnScreenDuration = v5 + v6->_accumulatedOnScreenDuration;
  }
  else
  {
    v6 = 0;
  }

  v7 = os_log_create("com.apple.pencilkit", "Pencil Observer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_DEFAULT, "Pencil On Screen Duration: %.3f", (uint8_t *)&v8, 0xCu);
  }

  -[PKPencilObserverInteraction performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hidePencilShadowViewIfNecessary, 0, 0.0666666667);
}

- (uint64_t)workaroundShadowUpdateEnded
{
  void *v1;

  if (result)
  {
    v1 = (void *)result;
    result = -[PKPencilObserverInteraction isActive](result);
    if ((result & 1) == 0)
      return objc_msgSend(v1, "performSelector:withObject:afterDelay:", sel_hidePencilShadowViewIfNecessary, 0, 0.0666666667);
  }
  return result;
}

- (void)hidePencilShadowViewIfNecessary
{
  if ((-[PKPencilObserverInteraction isActive]((uint64_t)self) & 1) == 0)
  {
    std::vector<PKInputPoint>::resize((uint64_t)&self->_inputPoints, 0);
    -[PKPencilShadowView hideShadow](self->_shadowView, "hideShadow");
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  PKHoverController *hoverController;
  BOOL v7;

  v5 = a4;
  if (objc_msgSend(v5, "type") == 2 && (hoverController = self->_hoverController) != 0)
  {
    -[PKHoverController didReceiveNormalTouch:]((uint64_t)hoverController, v5);
    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  return 0;
}

- (void)pencilInteractionDidTap:(id)a3
{
  PKHoverController *hoverController;
  int waitingForHoverHoldTimestamp_low;
  PKPencilStatisticsManager *statisticsManager;
  unint64_t *p_doubleTapsInRange;

  -[PKPencilStatisticsManager startAnalyticsSessionIfNecessary]((uint64_t)self->_statisticsManager);
  hoverController = self->_hoverController;
  if (hoverController)
  {
    waitingForHoverHoldTimestamp_low = LOBYTE(hoverController->_waitingForHoverHoldTimestamp);
    statisticsManager = self->_statisticsManager;
    if (waitingForHoverHoldTimestamp_low)
    {
      if (!statisticsManager)
        return;
      p_doubleTapsInRange = &statisticsManager->_doubleTapsInRange;
      goto LABEL_8;
    }
  }
  else
  {
    statisticsManager = self->_statisticsManager;
  }
  if (!statisticsManager)
    return;
  p_doubleTapsInRange = &statisticsManager->_doubleTapsOutsideRange;
LABEL_8:
  ++*p_doubleTapsInRange;
}

- (UIView)view
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak((id *)&self->_view, a3);
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_pencilInteraction);
  objc_storeStrong((id *)&self->_pencilObserver, 0);
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_storeStrong((id *)&self->_statisticsManager, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  begin = self->_inputPoints.__begin_;
  if (begin)
  {
    self->_inputPoints.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
