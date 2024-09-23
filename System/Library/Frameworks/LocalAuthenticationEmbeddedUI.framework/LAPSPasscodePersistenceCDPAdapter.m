@implementation LAPSPasscodePersistenceCDPAdapter

- (void)reportPasscodeDidChangeTo:(id)a3 passcodeType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (getCDPStateControllerClass())
  {
    v11 = objc_alloc_init((Class)getCDPStateControllerClass());
    v12 = -[LAPSPasscodePersistenceCDPAdapter _deviceSecretType:](self, "_deviceSecretType:", v9);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __87__LAPSPasscodePersistenceCDPAdapter_reportPasscodeDidChangeTo_passcodeType_completion___block_invoke;
    v15[3] = &unk_24FDCD818;
    v16 = v11;
    v17 = v10;
    v13 = v11;
    objc_msgSend(v13, "localSecretChangedTo:secretType:completion:", v8, v12, v15);

  }
  else
  {
    +[LAPSErrorBuilder genericErrorWithDebugDescription:](LAPSErrorBuilder, "genericErrorWithDebugDescription:", CFSTR("CDP update finished with error because required class was not found"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v14);

  }
}

uint64_t __87__LAPSPasscodePersistenceCDPAdapter_reportPasscodeDidChangeTo_passcodeType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (unint64_t)_deviceSecretType:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "identifier");
  if (v3 > 4)
    return 2;
  else
    return qword_22FEB4D40[v3];
}

@end
