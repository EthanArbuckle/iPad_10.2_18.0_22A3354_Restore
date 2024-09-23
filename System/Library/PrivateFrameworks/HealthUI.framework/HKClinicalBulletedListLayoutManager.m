@implementation HKClinicalBulletedListLayoutManager

void __72___HKClinicalBulletedListLayoutManager_drawGlyphsForGlyphRange_atPoint___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, uint64_t a10, uint64_t a11)
{
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  CGRect v32;
  CGRect v33;

  v21 = objc_msgSend(*(id *)(a1 + 32), "characterIndexForGlyphAtIndex:");
  objc_msgSend(*(id *)(a1 + 40), "attribute:atIndex:effectiveRange:", CFSTR("_IsBulletedAttributeName"), v21, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HKSafeObject();
  v31 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v31, "BOOLValue"))
  {
    if (!a11)
      goto LABEL_4;
    v23 = v21 - 1;
    objc_msgSend(*(id *)(a1 + 40), "string");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "substringWithRange:", v23, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("\n"));

    if (v26)
    {
LABEL_4:
      v32.origin.x = a6;
      v32.origin.y = a7;
      v32.size.width = a8;
      v32.size.height = a9;
      v27 = CGRectGetMidY(v32) + *(double *)(*(_QWORD *)(a1 + 32) + 272) * -0.5;
      if (*(_QWORD *)(a1 + 48) == 1)
      {
        v33.origin.x = a2;
        v33.origin.y = a3;
        v33.size.width = a4;
        v33.size.height = a5;
        v28 = CGRectGetMaxX(v33) - *(double *)(*(_QWORD *)(a1 + 32) + 264);
      }
      else
      {
        v28 = *MEMORY[0x1E0C9D538];
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "set");

      objc_msgSend(*(id *)(a1 + 32), "bullet");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "drawAtPoint:", v28, v27);

    }
  }

}

@end
