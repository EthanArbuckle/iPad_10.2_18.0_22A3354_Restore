@implementation MKBalloonCalloutView

uint64_t __48___MKBalloonCalloutView_setShowsArrow_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureForArrowStateWithDuration:", *(double *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_mapkit_setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "_mapkit_layoutIfNeeded");
}

uint64_t __51___MKBalloonCalloutView_updateWithNewCalloutOffset__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_idealFrame");
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:");
}

_BYTE *__54___MKBalloonCalloutView_showAnimated_completionBlock___block_invoke(uint64_t a1)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[610])
    return (_BYTE *)objc_msgSend(result, "_showAnimated:completionBlock:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __55___MKBalloonCalloutView__showAnimated_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MKBalloonCalloutDidShowNotification"), *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __55___MKBalloonCalloutView__showAnimated_completionBlock___block_invoke_144(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MKBalloonCalloutDidShowNotification"), *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __57___MKBalloonCalloutView_dismissAnimated_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __57___MKBalloonCalloutView_dismissAnimated_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
