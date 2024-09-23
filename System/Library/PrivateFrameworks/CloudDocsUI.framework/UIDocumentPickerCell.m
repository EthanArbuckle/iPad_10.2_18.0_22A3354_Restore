@implementation UIDocumentPickerCell

uint64_t __47___UIDocumentPickerCell__updateSelectionState___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "setAlpha:", 1.0);
}

uint64_t __47___UIDocumentPickerCell__updateSelectionState___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "setAlpha:", 0.0);
}

uint64_t __47___UIDocumentPickerCell__updateSelectionState___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 912), "removeFromSuperview");
}

id __47___UIDocumentPickerCell__updateSelectionState___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;

  v2 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("UITintedCircularButtonCheckmark"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.CloudDocsUI"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("DocumentSelectionCheckmarkBackground"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "size");
  objc_msgSend(v5, "scale");
  v18 = v5;
  v10 = v5;
  _UIGraphicsDrawIntoImageContextWithOptions();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "size");
  objc_msgSend(v10, "scale");
  v16 = v9;
  v17 = v11;
  v12 = v11;
  v13 = v9;
  _UIGraphicsDrawIntoImageContextWithOptions();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __47___UIDocumentPickerCell__updateSelectionState___block_invoke_5(uint64_t a1)
{
  CGContext *CurrentContext;
  CGFloat v3;
  double v4;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGRect v8;

  CurrentContext = UIGraphicsGetCurrentContext();
  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x24BDBEFB0], v4);
  CGContextSetCompositeOperation();
  objc_msgSend(*(id *)(a1 + 40), "tintColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v5, "CGColor"));

  objc_msgSend(*(id *)(a1 + 32), "size");
  v8.size.width = v6;
  v8.size.height = v7;
  v8.origin.x = v3;
  v8.origin.y = v4;
  CGContextFillRect(CurrentContext, v8);
}

uint64_t __47___UIDocumentPickerCell__updateSelectionState___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  objc_msgSend(*(id *)(a1 + 40), "size");
  objc_msgSend(*(id *)(a1 + 32), "size");
  UIRectCenteredIntegralRect();
  return objc_msgSend(*(id *)(a1 + 40), "drawAtPoint:");
}

uint64_t __47___UIDocumentPickerCell_updateForEditingState___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateSeparatorInset");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __41___UIDocumentPickerCell_availableActions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "shouldShowAction:", a2))
  {
    objc_msgSend(*(id *)(a1 + 32), "item");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isActionApplicableForItem:", a2);

    if (!v8)
      return;
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "actions");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v6);
  }

}

@end
