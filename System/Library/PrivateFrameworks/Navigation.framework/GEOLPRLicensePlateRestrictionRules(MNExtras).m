@implementation GEOLPRLicensePlateRestrictionRules(MNExtras)

- (id)plateRegionsContainingLatLngs:()MNExtras inRadius:
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  double v17;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "licensePlateRegionsCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "licensePlateRegions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__GEOLPRLicensePlateRestrictionRules_MNExtras__plateRegionsContainingLatLngs_inRadius___block_invoke;
  v14[3] = &unk_1E61D2D70;
  v15 = v6;
  v17 = a2;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

@end
