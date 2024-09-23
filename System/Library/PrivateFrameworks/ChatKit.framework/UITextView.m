@implementation UITextView

uint64_t __89__UITextView_PrintSupport__ck_textKit2_drawVisibleTextInCurrentContextWithContainerView___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unsigned int v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "rangeInElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsRange:", v5);

  if ((_DWORD)v6)
  {
    v34 = v6;
    objc_msgSend(v3, "layoutFragmentFrame");
    v37 = v8;
    v38 = v7;
    v35 = v10;
    v36 = v9;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    objc_msgSend(v3, "textLineFragments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v43 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 40), "textLayoutManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "location");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "locationFromLocation:withOffset:", v18, objc_msgSend(v16, "characterRange"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(*(id *)(a1 + 32), "containsLocation:", v19))
          {
            objc_msgSend(v16, "typographicBounds");
            v21 = v20;
            v40 = v22;
            v41 = v20;
            v23 = v22;
            v25 = v24;
            v39 = v26;
            v27 = *(double *)(a1 + 48);
            v48.origin.x = v38;
            v48.origin.y = v37;
            v48.size.width = v36;
            v48.size.height = v35;
            v28 = v27 + CGRectGetMinX(v48);
            v49.origin.x = v21;
            v49.origin.y = v23;
            v49.size.width = v25;
            v49.size.height = v39;
            v29 = v28 + CGRectGetMinX(v49);
            v30 = *(double *)(a1 + 56);
            v50.origin.x = v38;
            v50.origin.y = v37;
            v50.size.width = v36;
            v50.size.height = v35;
            v31 = v30 + CGRectGetMinY(v50);
            v51.origin.y = v40;
            v51.origin.x = v41;
            v51.size.width = v25;
            v51.size.height = v39;
            v32 = v31 + CGRectGetMinY(v51);
            objc_msgSend(v16, "drawAtPoint:inContext:", UIGraphicsGetCurrentContext(), v29, v32);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v13);
    }

    v6 = v34;
  }

  return v6;
}

uint64_t __113__UITextView_SupportsDynamicallyTogglingAllowsTextAnimations__ck_supportsDynamicallyTogglingAllowsTextAnimations__block_invoke(uint64_t a1)
{
  uint64_t result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    result = objc_msgSend(*(id *)(a1 + 32), "supportsDynamicallyTogglingAllowsTextAnimations");
  else
    result = 0;
  ck_supportsDynamicallyTogglingAllowsTextAnimations_supportsToggling = result;
  return result;
}

@end
