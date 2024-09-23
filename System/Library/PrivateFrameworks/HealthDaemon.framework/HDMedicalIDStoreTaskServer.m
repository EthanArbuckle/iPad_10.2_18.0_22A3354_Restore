@implementation HDMedicalIDStoreTaskServer

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;
  char v9;

  v5 = a3;
  v6 = *MEMORY[0x1E0CB5398];
  if (objc_msgSend(v5, "hasRequiredEntitlement:error:", *MEMORY[0x1E0CB5398], a4))
  {
    objc_msgSend(v5, "valueForEntitlement:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v8 = objc_opt_isKindOfClass() ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }
  v9 = objc_msgSend(v5, "hasRequiredArrayEntitlement:containing:error:", v6, *MEMORY[0x1E0CB4DB0], a4) | v8;

  return v9 & 1;
}

- (id)medicalIDDataManagerWithError:(void *)a1
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (a1)
  {
    objc_msgSend(a1, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "medicalIDDataManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(a1, "profile");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "medicalIDDataManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_featureUnavailableForProfileError");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v6);
        else
          _HKLogDroppedError();
      }

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)remote_fetchMedicalIDWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v9 = v6;
  objc_msgSend(v5, "fetchMedicalIDIfSetUpWithError:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_fetchMedicalIDDataIfSetUpOrCreateDefaultWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v9 = v6;
  objc_msgSend(v5, "fetchMedicalIDDataIfSetUpOrCreateDefaultWithError:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_updateMedicalIDData:(id)a3 lastFetchedMedicalIDData:(id)a4 completion:(id)a5
{
  void (**v7)(id, uint64_t, id);
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v7 = (void (**)(id, uint64_t, id))a5;
  v18 = 0;
  v8 = a3;
  -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  v17 = v10;
  v11 = objc_msgSend(v9, "updateMedicalIDWithLocalData:error:", v8, &v17);

  v12 = v17;
  if ((_DWORD)v11)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "daemon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "analyticsSubmissionCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDStandardTaskServer profile](self, "profile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "medicalID_reportHasBeenSetForProfileType:", objc_msgSend(v16, "profileType"));

  }
  v7[2](v7, v11, v12);

}

- (void)remote_deleteMedicalIDDataWithLastFetchedMedicalIDData:(id)a3 completion:(id)a4
{
  void (**v5)(id, uint64_t, id);
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v5 = (void (**)(id, uint64_t, id))a4;
  v15 = 0;
  -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v14 = v7;
  v8 = objc_msgSend(v6, "deleteMedicalIDDataWithError:", &v14);
  v9 = v14;

  if ((_DWORD)v8)
  {
    -[HDStandardTaskServer profile](self, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "daemon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "analyticsSubmissionCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDStandardTaskServer profile](self, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "medicalID_reportHasBeenDeletedForProfileType:", objc_msgSend(v13, "profileType"));

  }
  v5[2](v5, v8, v9);

}

- (void)remote_medicalIDEmergencyContactsWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = 0;
  v4 = (void (**)(id, void *, id))a3;
  -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v9 = v6;
  objc_msgSend(v5, "medicalIDEmergencyContactsWithError:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_medicalIDClinicalContactsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v13 = 0;
  v4 = a3;
  -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  v12 = v6;
  objc_msgSend(v5, "medicalIDClinicalContactsWithError:", &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;

  if (v7 || !v8)
  {
    v9 = v4;
    v10 = v7;
    v11 = 0;
  }
  else
  {
    v9 = v4;
    v10 = 0;
    v11 = v8;
  }
  (*((void (**)(id, void *, id))v4 + 2))(v9, v10, v11);

}

- (void)remote_addEmergencyContact:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v29 = 0;
  -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v29);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  if (v8)
  {
    v28 = 0;
    objc_msgSend(v8, "fetchMedicalIDIfSetUpWithError:", &v28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v28;
    v12 = v11;
    if (v10)
    {
      objc_msgSend(v10, "emergencyContacts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "containsObject:", v6);

      if (v14)
      {
        v7[2](v7, 1, 0);
      }
      else
      {
        objc_msgSend(v10, "emergencyContacts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");
        v17 = *MEMORY[0x1E0CB71C8];

        if (v16 >= v17)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 130, CFSTR("Medical ID emergency contact limit exceeded. Unable to add additional emergency contacts."));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v21);

        }
        else
        {
          objc_msgSend(v10, "emergencyContacts");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend(v10, "emergencyContacts");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "arrayByAddingObject:", v6);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setEmergencyContacts:", v20);

          }
          else
          {
            v30[0] = v6;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setEmergencyContacts:", v19);
          }

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setEmergencyContactsModifiedDate:", v22);

          v27 = 0;
          v23 = objc_msgSend(v8, "updateMedicalIDWithLocalData:error:", v10, &v27);
          v24 = v27;
          v25 = v24;
          if ((_DWORD)v23)
            v26 = 0;
          else
            v26 = v24;
          ((void (**)(id, uint64_t, id))v7)[2](v7, v23, v26);

        }
      }
    }
    else
    {
      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 111, CFSTR("Medical ID has not been configured."));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v12);
    }

  }
  else
  {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v9);
  }

}

- (void)remote_removeEmergencyContact:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v23 = 0;
  -[HDMedicalIDStoreTaskServer medicalIDDataManagerWithError:](self, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  if (v8)
  {
    v22 = 0;
    objc_msgSend(v8, "fetchMedicalIDIfSetUpWithError:", &v22);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v22;
    if (v10
      && (objc_msgSend(v10, "emergencyContacts"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "containsObject:", v6),
          v12,
          (v13 & 1) != 0))
    {
      objc_msgSend(v10, "emergencyContacts");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "mutableCopy");

      objc_msgSend(v15, "removeObject:", v6);
      objc_msgSend(v10, "setEmergencyContacts:", v15);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setEmergencyContactsModifiedDate:", v16);

      v21 = 0;
      v17 = objc_msgSend(v8, "updateMedicalIDWithLocalData:error:", v10, &v21);
      v18 = v21;
      v19 = v18;
      if ((_DWORD)v17)
        v20 = 0;
      else
        v20 = v18;
      ((void (**)(id, uint64_t, id))v7)[2](v7, v17, v20);

    }
    else
    {
      v7[2](v7, 1, 0);
    }

  }
  else
  {
    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v9);
  }

}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6848], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6848], "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6848], "clientInterface");
}

@end
