@implementation HDDrugInteractionEngineTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0D2C510];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C418], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0D2C418], "clientInterface");
}

- (void)remote_interactionClassesForConceptWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[HDDrugInteractionEngine interactionClassesForConceptWithIdentifier:profile:error:](HDDrugInteractionEngine, "interactionClassesForConceptWithIdentifier:profile:error:", v7, v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)remote_interactionClassesForMedication:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[HDDrugInteractionEngine interactionClassesForMedication:profile:error:](HDDrugInteractionEngine, "interactionClassesForMedication:profile:error:", v7, v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)remote_numberOfInteractionsForConceptWithIdentifier:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[HDDrugInteractionEngine numberOfInteractionsForConceptWithIdentifier:profile:error:](HDDrugInteractionEngine, "numberOfInteractionsForConceptWithIdentifier:profile:error:", v7, v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)remote_numberOfInteractionsForMedication:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[HDDrugInteractionEngine numberOfInteractionsForMedication:profile:error:](HDDrugInteractionEngine, "numberOfInteractionsForMedication:profile:error:", v7, v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)remote_interactionClassForLifestyleFactor:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, _QWORD, id);
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v6 = (void (**)(id, _QWORD, id))a4;
  -[HDStandardTaskServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = 0;
  LODWORD(a3) = +[HDDrugInteractionEngine interactionClassForLifestyleFactor:profile:interactionClassOut:error:](HDDrugInteractionEngine, "interactionClassForLifestyleFactor:profile:interactionClassOut:error:", a3, v7, &v12, &v11);
  v8 = v12;
  v9 = v11;

  if ((_DWORD)a3)
    v10 = v8;
  else
    v10 = 0;
  ((void (**)(id, id, id))v6)[2](v6, v10, v9);

}

- (void)remote_interactionResultsForInteractionClasses:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[HDDrugInteractionEngine interactionResultsForInteractionClasses:profile:error:](HDDrugInteractionEngine, "interactionResultsForInteractionClasses:profile:error:", v7, v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)remote_interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD, id);
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v8 = (void (**)(id, _QWORD, id))a5;
  v9 = a4;
  v10 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  v12 = +[HDDrugInteractionEngine interactionResultForFirstMedication:secondMedication:profile:interactionResultOut:error:](HDDrugInteractionEngine, "interactionResultForFirstMedication:secondMedication:profile:interactionResultOut:error:", v10, v9, v11, &v17, &v16);

  v13 = v17;
  v14 = v16;

  if (v12)
    v15 = v13;
  else
    v15 = 0;
  ((void (**)(id, id, id))v8)[2](v8, v15, v14);

}

- (void)remote_interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD, id);
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v8 = (void (**)(id, _QWORD, id))a5;
  v9 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  LODWORD(a4) = +[HDDrugInteractionEngine interactionResultForMedication:lifestyleFactor:profile:interactionResultOut:error:](HDDrugInteractionEngine, "interactionResultForMedication:lifestyleFactor:profile:interactionResultOut:error:", v9, a4, v10, &v15, &v14);

  v11 = v15;
  v12 = v14;

  if ((_DWORD)a4)
    v13 = v11;
  else
    v13 = 0;
  ((void (**)(id, id, id))v8)[2](v8, v13, v12);

}

- (void)remote_interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *, id);
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v8 = (void (**)(id, void *, id))a5;
  v9 = a4;
  v10 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  +[HDDrugInteractionEngine interactionResultsForMedications:lifestyleFactors:profile:error:](HDDrugInteractionEngine, "interactionResultsForMedications:lifestyleFactors:profile:error:", v10, v9, v11, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v14;
  v8[2](v8, v12, v13);

}

@end
