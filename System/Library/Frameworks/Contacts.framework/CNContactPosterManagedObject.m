@implementation CNContactPosterManagedObject

- (void)updateWithContactPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  -[CNContactPosterManagedObject setIgnoredForRevert:](self, "setIgnoredForRevert:", objc_msgSend(v4, "ignoredForRevert"));
  objc_msgSend(v4, "posterData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPosterManagedObject setPosterData:](self, "setPosterData:", v5);

  objc_msgSend(v4, "lastUsedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPosterManagedObject setLastUsedDate:](self, "setLastUsedDate:", v6);

  -[CNContactPosterManagedObject setPairedImage:](self, "setPairedImage:", 0);
  objc_msgSend(v4, "visualFingerprintData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPosterManagedObject setVisualFingerprintData:](self, "setVisualFingerprintData:", v7);

  v8 = objc_msgSend(v4, "contentIsSensitive");
  -[CNContactPosterManagedObject setContentIsSensitive:](self, "setContentIsSensitive:", v8);
}

- (void)updateWithContactPoster:(id)a3 pairedImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  -[CNContactPosterManagedObject setIgnoredForRevert:](self, "setIgnoredForRevert:", objc_msgSend(v7, "ignoredForRevert"));
  objc_msgSend(v7, "posterData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPosterManagedObject setPosterData:](self, "setPosterData:", v8);

  objc_msgSend(v7, "lastUsedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPosterManagedObject setLastUsedDate:](self, "setLastUsedDate:", v9);

  objc_msgSend(v7, "visualFingerprintData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPosterManagedObject setVisualFingerprintData:](self, "setVisualFingerprintData:", v10);

  -[CNContactPosterManagedObject setPairedImage:](self, "setPairedImage:", v6);
  v11 = objc_msgSend(v7, "contentIsSensitive");

  -[CNContactPosterManagedObject setContentIsSensitive:](self, "setContentIsSensitive:", v11);
}

- (void)setupWithContactPoster:(id)a3 contactIdentifier:(id)a4
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

  -[CNContactPosterManagedObject setIdentifier:](self, "setIdentifier:", v11);
  -[CNContactPosterManagedObject setContactIdentifier:](self, "setContactIdentifier:", v7);

  -[CNContactPosterManagedObject updateWithContactPoster:](self, "updateWithContactPoster:", v8);
}

- (void)setupWithContactPoster:(id)a3 pairedImage:(id)a4 contactIdentifier:(id)a5
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

  -[CNContactPosterManagedObject setIdentifier:](self, "setIdentifier:", v14);
  -[CNContactPosterManagedObject setContactIdentifier:](self, "setContactIdentifier:", v9);

  -[CNContactPosterManagedObject updateWithContactPoster:pairedImage:](self, "updateWithContactPoster:pairedImage:", v11, v10);
}

+ (id)managedObjectToContactPosterTransform
{
  return (id)objc_msgSend(&__block_literal_global_113, "copy");
}

CNContactPoster *__69__CNContactPosterManagedObject_managedObjectToContactPosterTransform__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNContactPoster *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNContactPoster *v8;
  CNContactPoster *v9;
  void *v10;
  void *v11;
  NSString *v12;
  double x;
  double y;
  double width;
  double height;
  CNContactImage *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  CNContactImage *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CNContactPoster *v43;
  NSRect v44;

  v2 = a2;
  v3 = [CNContactPoster alloc];
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "posterData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastUsedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[CNContactPoster initWithIdentifier:posterData:lastUsedDate:](v3, "initWithIdentifier:posterData:lastUsedDate:", v5, v6, v7);

  v9 = v8;
  -[CNContactPoster setIgnoredForRevert:](v8, "setIgnoredForRevert:", objc_msgSend(v2, "ignoredForRevert"));
  objc_msgSend(v2, "visualFingerprintData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v9;
  -[CNContactPoster setVisualFingerprintData:](v9, "setVisualFingerprintData:", v10);

  -[CNContactPoster setContentIsSensitive:](v9, "setContentIsSensitive:", objc_msgSend(v2, "contentIsSensitive"));
  objc_msgSend(v2, "pairedImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cropRectString");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v44 = NSRectFromString(v12);
  x = v44.origin.x;
  y = v44.origin.y;
  width = v44.size.width;
  height = v44.size.height;

  v17 = [CNContactImage alloc];
  objc_msgSend(v2, "pairedImage");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "identifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "UUIDString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedImage");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "imageData");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedImage");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lastUsedDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedImage");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "source");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v37, "integerValue");
  objc_msgSend(v2, "pairedImage");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "sourceIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedImage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "variant");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "poseConfigurationData");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedImage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pairedImage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v29) = objc_msgSend(v24, "ignoredForRevert");
  v35 = -[CNContactImage initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:](v17, "initWithIdentifier:imageData:lastUsedDate:cropRect:source:sourceIdentifier:variant:poseConfigurationData:displayString:ignoredForRevert:", v33, v31, v18, v34, v30, v19, x, y, width, height, v21, v23, v29);

  objc_msgSend(v2, "pairedImage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "visualFingerprintData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVisualFingerprint fingerprintFromArchive:](CNVisualFingerprint, "fingerprintFromArchive:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactImage setVisualFingerprint:](v35, "setVisualFingerprint:", v27);

  -[CNContactPoster setPairedImage:](v43, "setPairedImage:", v35);
  return v43;
}

@end
