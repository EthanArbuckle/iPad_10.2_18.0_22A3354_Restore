@implementation UIView(CRKCardSectionView)

- (void)setCardSectionViewIdentifier:()CRKCardSectionView
{
  objc_setAssociatedObject(a1, sel_cardSectionViewIdentifier, a3, (void *)0x303);
}

- (id)cardSectionViewIdentifier
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_getAssociatedObject(a1, sel_cardSectionViewIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = a1;
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_218FCB000, v4, OS_LOG_TYPE_INFO, "Card section view %@ does not have a card section view identifier. This is a requirement. Category CRKCardSectionView on CRKUINSView is setting one (%@) via an objc associated object on the client's behalf as a workaround", (uint8_t *)&v7, 0x16u);
    }
    objc_msgSend(a1, "setCardSectionViewIdentifier:", v2);
  }
  v5 = v2;

  return v5;
}

- (void)setComposedSuperview:()CRKCardSectionView
{
  objc_setAssociatedObject(a1, sel_composedSuperview, a3, 0);
}

- (id)composedSuperview
{
  void *v2;
  void *v3;
  id v4;

  objc_getAssociatedObject(a1, sel_composedSuperview);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    objc_setAssociatedObject(a1, sel_composedSuperview, 0, 0);

  return v3;
}

- (void)removeFromComposedSuperview
{
  id v2;

  objc_msgSend(a1, "composedSuperview");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cardSectionSubviewWantsToBeRemovedFromHierarchy:", a1);

}

+ (double)sizeThatFitsCardSection:()CRKCardSectionView boundingSize:
{
  id v5;
  double v6;
  double v7;

  v5 = objc_alloc_init(a1);
  objc_msgSend(v5, "sizeThatFits:", a2, a3);
  v7 = v6;

  return v7;
}

@end
