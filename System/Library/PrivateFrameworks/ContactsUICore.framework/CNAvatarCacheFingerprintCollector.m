@implementation CNAvatarCacheFingerprintCollector

- (CNAvatarCacheFingerprintCollector)init
{
  CNAvatarCacheFingerprintCollector *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *fingerprints;
  CNAvatarCacheFingerprintCollector *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CNAvatarCacheFingerprintCollector;
  v2 = -[CNAvatarCacheFingerprintCollector init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    fingerprints = v2->_fingerprints;
    v2->_fingerprints = v3;

    v5 = v2;
  }

  return v2;
}

- (NSArray)fingerprintsOfAffectedContacts
{
  void *v2;
  void *v3;

  -[NSMutableOrderedSet array](self->_fingerprints, "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUnified");

  if (v6)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v4, "contact", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "linkedContacts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          +[CNUILikenessFingerprint fingerprintForContact:](CNUILikenessFingerprint, "fingerprintForContact:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableOrderedSet addObject:](self->_fingerprints, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

  }
  objc_msgSend(v4, "contact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUILikenessFingerprint fingerprintForContact:](CNUILikenessFingerprint, "fingerprintForContact:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableOrderedSet addObject:](self->_fingerprints, "addObject:", v15);
}

- (void)visitDeleteContactEvent:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "contactIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNUILikenessFingerprint fingerprintForContactIdentifier:](CNUILikenessFingerprint, "fingerprintForContactIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableOrderedSet addObject:](self->_fingerprints, "addObject:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fingerprints, 0);
}

@end
