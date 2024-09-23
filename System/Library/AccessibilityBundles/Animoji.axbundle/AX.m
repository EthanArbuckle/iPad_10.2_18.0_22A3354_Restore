@implementation AX

void __71__AX_AvatarCarousel_initWithMessagesController_accessibilityContainer___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_axContainerAvatarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForItemClosestToCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_setAXCurrentIndex:", objc_msgSend(v3, "row"));
}

void __50__AX_AvatarCarousel__accessibilityScrollCarousel___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 < 1)
  {
    if (!v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollToViewAtIndex:animated:", 0, 1);
      objc_msgSend(*(id *)(a1 + 40), "_setAXCurrentIndex:", *(_QWORD *)(a1 + 56));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "loadRecords");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 56);
    v7 = v3;
    if (v4 <= objc_msgSend(v3, "count"))
    {
      v5 = *(void **)(a1 + 32);
      objc_msgSend(v7, "objectAtIndex:", *(_QWORD *)(a1 + 56) - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "displayAvatarForRecord:animated:", v6, 0);

      objc_msgSend(*(id *)(a1 + 40), "_setAXCurrentIndex:", *(_QWORD *)(a1 + 56));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
}

@end
