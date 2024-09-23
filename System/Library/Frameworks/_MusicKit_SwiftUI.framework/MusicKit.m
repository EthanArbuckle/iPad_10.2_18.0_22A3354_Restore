@implementation MusicKit

void __88__MusicKit_SPI_SKCloudServiceSetupViewController__musicKit_underlyingOptionsForOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("musicKit_action")))
  {
    v6 = (id)*MEMORY[0x24BDEA730];
    if (objc_msgSend(v5, "isNSString"))
    {
      objc_msgSend(*(id *)(a1 + 32), "_musicKit_underlyingActionForAction:", v5);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    }
LABEL_13:
    v8 = 0;
    if (!v6)
      goto LABEL_20;
    goto LABEL_14;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("musicKit_iTunesItemIdentifier")))
  {
    v9 = (id *)MEMORY[0x24BDEA748];
LABEL_12:
    v6 = *v9;
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("musicKit_affiliateToken")))
  {
    v9 = (id *)MEMORY[0x24BDEA738];
    goto LABEL_12;
  }
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("musicKit_campaignToken")))
  {
    v9 = (id *)MEMORY[0x24BDEA740];
    goto LABEL_12;
  }
  if (!objc_msgSend(v10, "isEqualToString:", CFSTR("musicKit_messageIdentifier")))
  {
    v8 = 0;
    goto LABEL_20;
  }
  v6 = (id)*MEMORY[0x24BDEA750];
  if (!objc_msgSend(v5, "isNSString"))
    goto LABEL_13;
  objc_msgSend(*(id *)(a1 + 32), "_musicKit_underlyingMessageIdentifierForMessageIdentifier:", v5);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_4:
  v8 = (id)v7;
  if (!v6)
  {
LABEL_20:
    v6 = v10;
    if (!v8)
      goto LABEL_21;
    goto LABEL_15;
  }
LABEL_14:
  if (!v8)
LABEL_21:
    v8 = v5;
LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v8, v6);

}

@end
