@implementation LKError

+ (id)errorWithCode:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:userInfo:", a3, 0);
}

+ (id)errorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Not in Login Window");
      goto LABEL_36;
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Not entitled to perform that action");
      goto LABEL_36;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Operation interrupted");
      goto LABEL_36;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Connection interrupted");
      goto LABEL_36;
    case 5uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Connection invalidated");
      goto LABEL_36;
    case 6uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Class not found");
      goto LABEL_36;
    case 7uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("User not found");
      goto LABEL_36;
    case 8uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Wrong password");
      goto LABEL_36;
    case 9uLL:
      v12 = _os_feature_enabled_impl();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v12 & 1) != 0)
        v9 = CFSTR("Not a managed Apple Account");
      else
        v9 = CFSTR("Not a managed Apple ID");
      goto LABEL_36;
    case 0xAuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("User‘s Alt DSID is missing");
      goto LABEL_36;
    case 0xBuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("User has not authenticated remotely in the last 7 days");
      goto LABEL_36;
    case 0xCuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("User‘s short lived token is missing");
      goto LABEL_36;
    case 0xDuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Switching to user failed");
      goto LABEL_36;
    case 0xEuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("User‘s account is locked out");
      goto LABEL_36;
    case 0xFuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("The maximum number of users allowed on this device has been reached");
      goto LABEL_36;
    case 0x10uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("This Apple ID cannot be used on this device");
      goto LABEL_36;
    case 0x11uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Cannot create user");
      goto LABEL_36;
    case 0x12uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Passcode back off");
      goto LABEL_36;
    case 0x13uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("No internet connection");
      goto LABEL_36;
    case 0x14uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Cannot fetch authentication mode");
      goto LABEL_36;
    case 0x15uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Federated auth failed");
      goto LABEL_36;
    case 0x16uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Unknown authentication mode received");
      goto LABEL_36;
    case 0x17uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Server connection failed. Please try again.");
      goto LABEL_36;
    case 0x18uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Please try again");
      goto LABEL_36;
    case 0x19uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Login timed out");
      goto LABEL_36;
    case 0x1AuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Login was not ready for the given period of time");
      goto LABEL_36;
    case 0x1BuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Unable to register for a notification");
      goto LABEL_36;
    case 0x1CuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Device is not in multi user mode");
      goto LABEL_36;
    case 0x1DuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Device is not in homescreen");
      goto LABEL_36;
    case 0x1EuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Network request timed out");
      goto LABEL_36;
    case 0x1FuLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("Another login is ongoing");
LABEL_36:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24D59BB58, 0);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (v6)
        goto LABEL_37;
      goto LABEL_4;
    default:
      v10 = CFSTR("An error occurred");
      if (v5)
LABEL_37:
        v11 = (void *)objc_msgSend(v6, "mutableCopy");
      else
LABEL_4:
        v11 = (void *)objc_opt_new();
      v13 = v11;
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDD0FC8]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("LKLoginDomainErrorDomain"), a3, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
  }
}

@end
