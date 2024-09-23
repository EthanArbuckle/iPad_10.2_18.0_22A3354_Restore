@implementation AVTCoreModelPairing

- (AVTCoreModelPairing)initWithPairedCategory:(int64_t)a3 pairedTitle:(id)a4 pairTitle:(id)a5 unpairTitle:(id)a6 pairedDescription:(id)a7 unpairedDescription:(id)a8
{
  id v15;
  id v16;
  id v17;
  AVTCoreModelPairing *v18;
  AVTCoreModelPairing *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)AVTCoreModelPairing;
  v18 = -[AVTCoreModelPairing init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_pairedCategory = a3;
    objc_storeStrong((id *)&v18->_localizedPairedTitle, a4);
    objc_storeStrong((id *)&v19->_localizedPairTitle, a5);
    objc_storeStrong((id *)&v19->_localizedUnpairTitle, a6);
    objc_storeStrong((id *)&v19->_localizedPairedDescription, a7);
    objc_storeStrong((id *)&v19->_localizedUnpairedDescription, a8);
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVTCoreModelPairing;
  -[AVTCoreModelPairing description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[AVTCoreModelPairing pairedCategory](self, "pairedCategory");
  AVTPresetCategoryToString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreModelPairing localizedPairedTitle](self, "localizedPairedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreModelPairing localizedPairTitle](self, "localizedPairTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreModelPairing localizedUnpairTitle](self, "localizedUnpairTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreModelPairing localizedPairedDescription](self, "localizedPairedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTCoreModelPairing localizedUnpairedDescription](self, "localizedUnpairedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" AVTCoreModelPairing: category:%@\n pairedTitle: %@\n, pairTitle: %@\n, unpairTitle: %@\n pairedDescription: %@\n unpairedDescription: %@"), v5, v6, v7, v8, v9, v10);

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (int64_t)pairedCategory
{
  return self->_pairedCategory;
}

- (NSString)localizedPairedTitle
{
  return self->_localizedPairedTitle;
}

- (NSString)localizedPairTitle
{
  return self->_localizedPairTitle;
}

- (NSString)localizedUnpairTitle
{
  return self->_localizedUnpairTitle;
}

- (NSString)localizedPairedDescription
{
  return self->_localizedPairedDescription;
}

- (NSString)localizedUnpairedDescription
{
  return self->_localizedUnpairedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedUnpairedDescription, 0);
  objc_storeStrong((id *)&self->_localizedPairedDescription, 0);
  objc_storeStrong((id *)&self->_localizedUnpairTitle, 0);
  objc_storeStrong((id *)&self->_localizedPairTitle, 0);
  objc_storeStrong((id *)&self->_localizedPairedTitle, 0);
}

@end
