@implementation LACUIAuthenticatorServiceConfigurationRequirementBuilder

+ (unint64_t)buildWithAvailableMechanisms:(id)a3
{
  id v3;
  LACUIAvailableMechanismsWrapper *v4;
  unint64_t v5;

  v3 = a3;
  v4 = -[LACUIAvailableMechanismsWrapper initWithMechanismEvents:]([LACUIAvailableMechanismsWrapper alloc], "initWithMechanismEvents:", v3);

  if (-[LACUIAvailableMechanismsWrapper isEmpty](v4, "isEmpty"))
    goto LABEL_2;
  if (-[LACUIAvailableMechanismsWrapper count](v4, "count") != 1)
  {
    if (-[LACUIAvailableMechanismsWrapper count](v4, "count") == 2)
    {
      if (-[LACUIAvailableMechanismsWrapper allowsPasscode](v4, "allowsPasscode")
        && -[LACUIAvailableMechanismsWrapper allowsBiometry](v4, "allowsBiometry"))
      {
        v5 = 4;
        goto LABEL_3;
      }
      if (!-[LACUIAvailableMechanismsWrapper allowsPasscode](v4, "allowsPasscode")
        || !-[LACUIAvailableMechanismsWrapper allowsWatch](v4, "allowsWatch"))
      {
        goto LABEL_2;
      }
    }
    else if (-[LACUIAvailableMechanismsWrapper count](v4, "count") != 3
           || !-[LACUIAvailableMechanismsWrapper allowsWatch](v4, "allowsWatch")
           || !-[LACUIAvailableMechanismsWrapper allowsBiometry](v4, "allowsBiometry")
           || !-[LACUIAvailableMechanismsWrapper allowsPasscode](v4, "allowsPasscode"))
    {
LABEL_2:
      v5 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_3;
    }
    v5 = 6;
    goto LABEL_3;
  }
  if (-[LACUIAvailableMechanismsWrapper allowsBiometry](v4, "allowsBiometry"))
  {
    v5 = 1;
  }
  else if (-[LACUIAvailableMechanismsWrapper allowsPasscode](v4, "allowsPasscode"))
  {
    v5 = 2;
  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_3:

  return v5;
}

+ (id)extractAvailableMechanisms:(unint64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBD1A8];
  switch(a3)
  {
    case 1uLL:
      +[LACUIAuthenticatorServiceConfigurationRequirementBuilder _biometryEvents]();
      return (id)objc_claimAutoreleasedReturnValue();
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605E0]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v5;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4uLL:
      +[LACUIAuthenticatorServiceConfigurationRequirementBuilder _biometryEvents]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605E0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v6;
      v7 = (void *)MEMORY[0x24BDBCE30];
      v8 = &v11;
      goto LABEL_6;
    case 6uLL:
      +[LACUIAuthenticatorServiceConfigurationRequirementBuilder _biometryEvents]();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605E0]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v6;
      v7 = (void *)MEMORY[0x24BDBCE30];
      v8 = &v10;
LABEL_6:
      objc_msgSend(v7, "arrayWithObjects:count:", v8, 1, v10, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)_biometryEvents
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605F0]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BE605E8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
