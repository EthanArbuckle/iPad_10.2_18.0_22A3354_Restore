@implementation GEOAllCollectionsViewResultFilterTypeAddress

- (GEOAllCollectionsViewResultFilterTypeAddress)initWithFilterAddressIdentifier:(id)a3 withPlaces:(id)a4
{
  id v7;
  id v8;
  GEOAllCollectionsViewResultFilterTypeAddress *v9;
  GEOAllCollectionsViewResultFilterTypeAddress *v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)GEOAllCollectionsViewResultFilterTypeAddress;
  v9 = -[GEOAllCollectionsViewResultFilterTypeAddress init](&v21, sel_init);
  if (v9)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__24;
    v19 = __Block_byref_object_dispose__24;
    v20 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__GEOAllCollectionsViewResultFilterTypeAddress_initWithFilterAddressIdentifier_withPlaces___block_invoke;
    v12[3] = &unk_1E1C07240;
    v13 = v7;
    v14 = &v15;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);
    if (!v16[5])
    {

      _Block_object_dispose(&v15, 8);
      v10 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v9->_filterAddressIdentifier, a3);
    objc_storeStrong((id *)&v9->_placeEntity, (id)v16[5]);

    _Block_object_dispose(&v15, 8);
  }
  v10 = v9;
LABEL_6:

  return v10;
}

void __91__GEOAllCollectionsViewResultFilterTypeAddress_initWithFilterAddressIdentifier_withPlaces___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  GEOMapItemIdentifier *v6;
  GEOMapItemIdentifier *v7;
  void *v8;
  GEOMapItemIdentifier *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = -[GEOMapItemIdentifier initWithPlace:]([GEOMapItemIdentifier alloc], "initWithPlace:", v13);
  v7 = [GEOMapItemIdentifier alloc];
  -[GEOPDAllCollectionsViewResultFilterTypeAddress geoId](*(id **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v7, "initWithMapsIdentifier:", v8);

  if (-[GEOMapItemIdentifier isEqual:](v9, "isEqual:", v6))
  {
    +[GEOPDEntity entityForPlaceData:](GEOPDEntity, "entityForPlaceData:", v13);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a4 = 1;
  }

}

- (GEOMapItemIdentifier)filterAddressIdentifier
{
  GEOMapItemIdentifier *v3;
  void *v4;
  GEOMapItemIdentifier *v5;

  v3 = [GEOMapItemIdentifier alloc];
  -[GEOPDAllCollectionsViewResultFilterTypeAddress geoId]((id *)&self->_filterAddressIdentifier->super.super.isa);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v3, "initWithMapsIdentifier:", v4);

  return v5;
}

- (GEOPDAllCollectionsViewResultFilterTypeAddress)addressIdentifier
{
  return self->_filterAddressIdentifier;
}

- (NSString)displayString
{
  return (NSString *)-[GEOPDEntity bestLocalizedString](self->_placeEntity, "bestLocalizedString");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeEntity, 0);
  objc_storeStrong((id *)&self->_filterAddressIdentifier, 0);
}

@end
