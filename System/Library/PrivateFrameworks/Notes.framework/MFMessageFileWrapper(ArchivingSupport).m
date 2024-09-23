@implementation MFMessageFileWrapper(ArchivingSupport)

+ (void)supportedArchivedClassNames
{
  return &unk_1E81F01F8;
}

- (void)encodeWithCoder:()ArchivingSupport
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D461C0]);
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D461B0]), CFSTR("filename"));
  objc_msgSend(v5, "encodeObject:forKey:", *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D461C8]), CFSTR("preferredFilename"));
  objc_msgSend(v5, "encodeObject:forKey:", *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D461A8]), CFSTR("data"));
  objc_msgSend(v5, "encodeObject:forKey:", *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D461A0]), CFSTR("attributes"));
  objc_msgSend(v5, "encodeObject:forKey:", *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D461B8]), CFSTR("linkDestination"));
  objc_msgSend(v5, "encodeObject:forKey:", *(_QWORD *)(a1 + (int)*MEMORY[0x1E0D461D0]), CFSTR("url"));

}

- (char)initWithCoder:()ArchivingSupport
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  objc_super v29;

  v4 = a3;
  v29.receiver = a1;
  v29.super_class = (Class)&off_1EF903DC8;
  v5 = (char *)objc_msgSendSuper2(&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("path"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (int)*MEMORY[0x1E0D461C0];
    v8 = *(void **)&v5[v7];
    *(_QWORD *)&v5[v7] = v6;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("filename"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (int)*MEMORY[0x1E0D461B0];
    v11 = *(void **)&v5[v10];
    *(_QWORD *)&v5[v10] = v9;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("preferredFilename"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (int)*MEMORY[0x1E0D461C8];
    v14 = *(void **)&v5[v13];
    *(_QWORD *)&v5[v13] = v12;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("data"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D46080]), "initWithImmutableData:", v15);
    v17 = (int)*MEMORY[0x1E0D461A8];
    v18 = *(void **)&v5[v17];
    *(_QWORD *)&v5[v17] = v16;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("attributes"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (int)*MEMORY[0x1E0D461A0];
    v21 = *(void **)&v5[v20];
    *(_QWORD *)&v5[v20] = v19;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("linkDestination"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (int)*MEMORY[0x1E0D461B8];
    v24 = *(void **)&v5[v23];
    *(_QWORD *)&v5[v23] = v22;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("url"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (int)*MEMORY[0x1E0D461D0];
    v27 = *(void **)&v5[v26];
    *(_QWORD *)&v5[v26] = v25;

  }
  return v5;
}

@end
