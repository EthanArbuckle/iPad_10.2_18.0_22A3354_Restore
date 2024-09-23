@implementation MKUserLocationViewImageProvider

uint64_t __61___MKUserLocationViewImageProvider_initWithUserLocationView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateImage");
}

void __55___MKUserLocationViewImageProvider__updateDefaultImage__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setBalloonImage:", *(_QWORD *)(a1 + 40));

  v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGray3Color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setBalloonImageTintColor:", v3);

}

uint64_t __53___MKUserLocationViewImageProvider__contactsChanged___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateImage");
}

void __55___MKUserLocationViewImageProvider__updateContactImage__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "_setBalloonImage:", *(_QWORD *)(a1 + 40));

  v3 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v3, "_setBalloonImageTintColor:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGray3Color");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setBalloonImageTintColor:", v4);

  }
}

@end
