@implementation CNContactImageManagedObject

- (void)updateWithContactImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend(v4, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setImageData:](self, "setImageData:", v5);

  objc_msgSend(v4, "lastUsedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setLastUsedDate:](self, "setLastUsedDate:", v6);

  objc_msgSend(v4, "cropRect");
  -[CNContactImageManagedObject cropRectStringFromCGRect:](self, "cropRectStringFromCGRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setCropRectString:](self, "setCropRectString:", v7);

  objc_msgSend(v4, "displayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setDisplayString:](self, "setDisplayString:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "source"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setSource:](self, "setSource:", v9);

  objc_msgSend(v4, "sourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setSourceIdentifier:](self, "setSourceIdentifier:", v10);

  objc_msgSend(v4, "variant");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setVariant:](self, "setVariant:", v11);

  objc_msgSend(v4, "poseConfigurationData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setPoseConfigurationData:](self, "setPoseConfigurationData:", v12);

  -[CNContactImageManagedObject setIgnoredForRevert:](self, "setIgnoredForRevert:", objc_msgSend(v4, "ignoredForRevert"));
  objc_msgSend(v4, "visualFingerprint");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  +[CNVisualFingerprint archiveWithFingerprint:](CNVisualFingerprint, "archiveWithFingerprint:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setVisualFingerprintData:](self, "setVisualFingerprintData:", v13);

}

- (void)updateWithContactImage:(id)a3 pairedPoster:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a4;
  v6 = a3;
  objc_msgSend(v6, "imageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setImageData:](self, "setImageData:", v7);

  objc_msgSend(v6, "lastUsedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setLastUsedDate:](self, "setLastUsedDate:", v8);

  objc_msgSend(v6, "cropRect");
  -[CNContactImageManagedObject cropRectStringFromCGRect:](self, "cropRectStringFromCGRect:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setCropRectString:](self, "setCropRectString:", v9);

  objc_msgSend(v6, "displayString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setDisplayString:](self, "setDisplayString:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "source"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setSource:](self, "setSource:", v11);

  objc_msgSend(v6, "sourceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setSourceIdentifier:](self, "setSourceIdentifier:", v12);

  objc_msgSend(v6, "variant");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setVariant:](self, "setVariant:", v13);

  objc_msgSend(v6, "poseConfigurationData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setPoseConfigurationData:](self, "setPoseConfigurationData:", v14);

  -[CNContactImageManagedObject setIgnoredForRevert:](self, "setIgnoredForRevert:", objc_msgSend(v6, "ignoredForRevert"));
  objc_msgSend(v6, "visualFingerprint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNVisualFingerprint archiveWithFingerprint:](CNVisualFingerprint, "archiveWithFingerprint:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImageManagedObject setVisualFingerprintData:](self, "setVisualFingerprintData:", v16);

  -[CNContactImageManagedObject setPairedPoster:](self, "setPairedPoster:", v17);
}

- (void)setupWithContactImage:(id)a3 contactIdentifier:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v6 = (objc_class *)MEMORY[0x1E0CB3A28];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  objc_msgSend(v8, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v9, "initWithUUIDString:", v10);

  -[CNContactImageManagedObject setIdentifier:](self, "setIdentifier:", v11);
  -[CNContactImageManagedObject setContactIdentifier:](self, "setContactIdentifier:", v7);

  -[CNContactImageManagedObject updateWithContactImage:](self, "updateWithContactImage:", v8);
}

- (void)setupWithContactImage:(id)a3 pairedPoster:(id)a4 contactIdentifier:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v8 = (objc_class *)MEMORY[0x1E0CB3A28];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = [v8 alloc];
  objc_msgSend(v11, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v12, "initWithUUIDString:", v13);

  -[CNContactImageManagedObject setIdentifier:](self, "setIdentifier:", v14);
  -[CNContactImageManagedObject setContactIdentifier:](self, "setContactIdentifier:", v9);

  -[CNContactImageManagedObject updateWithContactImage:pairedPoster:](self, "updateWithContactImage:pairedPoster:", v11, v10);
}

+ (id)managedObjectToContactImageTransform
{
  return (id)objc_msgSend(&__block_literal_global_31, "copy");
}

CNContactImage *__67__CNContactImageManagedObject_managedObjectToContactImageTransform__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSString *v3;
  double x;
  double y;
  double width;
  double height;
  CNContactImage *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CNContactImage *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CNContactPoster *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  CNContactPoster *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSRect v34;

  v2 = a2;
  objc_msgSend(v2, "cropRectString");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v34 = NSRectFromString(v3);
  x = v34.origin.x;
  y = v34.origin.y;
  width = v34.size.width;
  height = v34.size.height;

  v8 = [CNContactImage alloc];
  objc_msgSend(v2, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastUsedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CNContactImage initWithIdentifier:imageData:cropRect:lastUsedDate:](v8, "initWithIdentifier:imageData:cropRect:lastUsedDate:", v10, v11, v12, x, y, width, height);

  objc_msgSend(v2, "source");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setSource:](v13, "setSource:", objc_msgSend(v14, "integerValue"));

  objc_msgSend(v2, "sourceIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setSourceIdentifier:](v13, "setSourceIdentifier:", v15);

  objc_msgSend(v2, "variant");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setVariant:](v13, "setVariant:", v16);

  objc_msgSend(v2, "displayString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setDisplayString:](v13, "setDisplayString:", v17);

  objc_msgSend(v2, "poseConfigurationData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setPoseConfigurationData:](v13, "setPoseConfigurationData:", v18);

  -[CNContactImage setIgnoredForRevert:](v13, "setIgnoredForRevert:", objc_msgSend(v2, "ignoredForRevert"));
  objc_msgSend(v2, "visualFingerprintData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVisualFingerprint fingerprintFromArchive:](CNVisualFingerprint, "fingerprintFromArchive:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setVisualFingerprint:](v13, "setVisualFingerprint:", v20);

  v21 = [CNContactPoster alloc];
  objc_msgSend(v2, "pairedPoster");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "identifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "UUIDString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedPoster");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "posterData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedPoster");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "lastUsedDate");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[CNContactPoster initWithIdentifier:posterData:lastUsedDate:](v21, "initWithIdentifier:posterData:lastUsedDate:", v24, v26, v28);
  -[CNContactImage setPairedPoster:](v13, "setPairedPoster:", v29);

  objc_msgSend(v2, "pairedPoster");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_msgSend(v30, "contentIsSensitive");
  -[CNContactImage pairedPoster](v13, "pairedPoster");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setContentIsSensitive:", v31);

  return v13;
}

@end
