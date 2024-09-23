@implementation ICPortraitLexiconSource

uint64_t __51___ICPortraitLexiconSource__makePPNamedEntityStore__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_makePPNamedEntityStore_store;
  _makePPNamedEntityStore_store = v0;

  return objc_msgSend((id)_makePPNamedEntityStore_store, "setClientIdentifier:", CFSTR("ICLex"));
}

uint64_t __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "setupContacts");

  }
  return 0;
}

uint64_t __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 1);
    +[_ICPortraitUtilities contactRecordFromPortraitContactRecord:](_ICPortraitUtilities, "contactRecordFromPortraitContactRecord:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleContact:", v7);

  }
  return 0;
}

void __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v2, "completeContacts");

    WeakRetained = v3;
  }

}

uint64_t __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "setupRecentContacts");

  }
  return 0;
}

uint64_t __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 1);
    +[_ICPortraitUtilities contactRecordFromPortraitContactRecord:](_ICPortraitUtilities, "contactRecordFromPortraitContactRecord:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleRecentContact:", v7);

  }
  return 0;
}

void __48___ICPortraitLexiconSource__makeContactDelegate__block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v2, "completeRecentContacts");

    WeakRetained = v3;
  }

}

uint64_t __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "setupNamedEntities");

  }
  return 0;
}

uint64_t __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 1);
    +[_ICPortraitUtilities namedEntityRecordFromPortraitNamedEntityRecord:](_ICPortraitUtilities, "namedEntityRecordFromPortraitNamedEntityRecord:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleNamedEntity:", v7);

  }
  return 0;
}

void __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v2, "completeNamedEntities");

    WeakRetained = v3;
  }

}

uint64_t __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_4(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v3, "setupRecentNamedEntities");

  }
  return 0;
}

uint64_t __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  id *v5;
  id v6;
  void *v7;

  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(WeakRetained + 1);
    +[_ICPortraitUtilities namedEntityRecordFromPortraitNamedEntityRecord:](_ICPortraitUtilities, "namedEntityRecordFromPortraitNamedEntityRecord:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleRecentNamedEntity:", v7);

  }
  return 0;
}

void __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_6(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v2, "completeRecentNamedEntities");

    WeakRetained = v3;
  }

}

void __52___ICPortraitLexiconSource__makeNamedEntityDelegate__block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  id v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v2, "resetNamedEntities");

    WeakRetained = v3;
  }

}

@end
