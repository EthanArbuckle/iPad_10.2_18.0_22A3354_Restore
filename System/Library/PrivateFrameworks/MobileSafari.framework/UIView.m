@implementation UIView

uint64_t __75__UIView_SafariServicesExtras__safari_performWithoutRetargetingAnimations___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_performWithoutRetargetingAnimations:", *(_QWORD *)(a1 + 32));
}

uint64_t __156__UIView_SafariGraphicsUtilities__sf_animate_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_preferredFrameRateRange_animations_completion___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  LODWORD(a4) = *(_DWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 40), "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1638400, *(_QWORD *)(a1 + 32), a2, a3, a4);
}

void __61__UIView_SafariServicesExtras___sf_setOrderedSubviews_count___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;

  v5 = *(void **)(a1[7] + 8 * a2);
  v6 = (void *)a1[4];
  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  objc_msgSend(v6, "objectAtIndexedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    *a3 = 1;
  }
}

void __81__UIView_SafariServicesExtras___sf_viewAncestrySummaryWithMinDepth_paddingLevel___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v5;
  id v6;

  v6 = a2;
  if (*(_QWORD *)(a1 + 48) + a3)
  {
    v5 = 0;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\t"));
      ++v5;
    }
    while (v5 < *(_QWORD *)(a1 + 48) + a3);
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", v6);
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));

}

void __157__UIView_SafariServicesExtras___sf_animateLinkImage_withAnimation_fromRect_inView_toRect_inView_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "valueForKey:", CFSTR("afterImageDisappearsKey"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  objc_msgSend(v12, "valueForKey:", CFSTR("afterDestinationLayerBounces"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  objc_msgSend(v12, "valueForKey:", CFSTR("layer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeFromSuperlayer");

  if (a3)
  {
    objc_msgSend(v12, "valueForKey:", CFSTR("isDestinationLayerAnimation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
      objc_msgSend(*(id *)(a1 + 48), "_sf_cancelLinkAnimationsOnSourceWindow:destinationWindow:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

uint64_t __122__UIView_SafariGraphicsUtilities__sf_animate_usingDefaultTimingWithOptions_preferredFrameRateRange_animations_completion___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  LODWORD(a4) = *(_DWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 40), "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1638400, *(_QWORD *)(a1 + 32), a2, a3, a4);
}

@end
