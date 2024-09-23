@implementation NSError(SYError)

+ (id)errorWithSYError:()SYError userInfo:
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend([a1 alloc], "initWithSYError:userInfo:", a3, v6);

  return v7;
}

- (uint64_t)initWithSYError:()SYError userInfo:
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v6 = (void *)objc_msgSend(a4, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 1);
  v9 = v8;

  v10 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    switch(a3)
    {
      case 2001:
        v12 = CFSTR("The receiver has not completed its setup.");
        goto LABEL_41;
      case 2002:
        v12 = CFSTR("The receiver is already running.");
        goto LABEL_41;
      case 2003:
        v12 = CFSTR("This operation cannot complete until pairing is completed.");
        goto LABEL_41;
      case 2004:
        v12 = CFSTR("This message is part of a session, but that session doesn't appear to exist.");
        goto LABEL_41;
      case 2005:
        v12 = CFSTR("The receiver already has a session in progress, and does not believe it should cancel that one to take this message.");
        goto LABEL_41;
      case 2006:
        v12 = CFSTR("The received message's session ID does not match the ID of the currently active session");
        goto LABEL_41;
      case 2007:
        v12 = CFSTR("The transaction timed out.");
        goto LABEL_41;
      case 2008:
        v12 = CFSTR("This feature is not supported by this client.");
        goto LABEL_41;
      case 2009:
        v12 = CFSTR("The SYSession is not currently running. Either it has not been started or it has completed.");
        goto LABEL_41;
      case 2010:
        v12 = CFSTR("The SYSession is currently starting or restarting, and cannot perform the requested operation.");
        goto LABEL_41;
      case 2011:
        v12 = CFSTR("The SYSession is not in the correct state to handle this message.");
        goto LABEL_41;
      case 2012:
        v12 = CFSTR("One or more sync batches failed to be delivered or acknowledged.");
        goto LABEL_41;
      case 2013:
        v12 = CFSTR("There is no data available for the given session.");
        goto LABEL_41;
      case 2014:
        v12 = CFSTR("A reset sync was sent to a master device from a slave. This is not supported.");
        goto LABEL_41;
      case 2015:
        v12 = CFSTR("The received message was not recognized.");
        goto LABEL_41;
      case 2016:
        v12 = CFSTR("The received message could not be deserialized, and may have become corrupted.");
        goto LABEL_41;
      case 2017:
        v12 = CFSTR("The system could not generate a sync message; some data was unavailable.");
        goto LABEL_41;
      case 2018:
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("The system tried to switch protocols on the fly, but failed."), v10);
        v13 = *MEMORY[0x24BDD0FF0];
        v12 = CFSTR("Retry the operation immediately -- the SYService should be able to start a new session correctly. It's the internal swap-stuff-around that's failed.");
        v14 = v9;
        goto LABEL_42;
      case 2019:
        v12 = CFSTR("The message was dropped due to a device switch.");
        goto LABEL_41;
      case 2020:
        v12 = CFSTR("A delegate object needs to implement an optional method to perform the requested action.");
        goto LABEL_41;
      case 2021:
        v12 = CFSTR("The session was terminated due to a device switch.");
        goto LABEL_41;
      case 2022:
        v12 = CFSTR("The session was canceled to make way for a requested reset sync.");
        goto LABEL_41;
      case 2023:
        v12 = CFSTR("The session was canceled due to losing in a collision; the winning session will begin momentarily.");
        goto LABEL_41;
      case 2024:
        v12 = CFSTR("A reset request was sent to a slave device, which is invalid.");
        goto LABEL_41;
      default:
        switch(a3)
        {
          case 1001:
            v12 = CFSTR("Waiting for Full Sync");
            break;
          case 1002:
            v12 = CFSTR("Session ID mismatch");
            break;
          case 1003:
            v12 = CFSTR("Snsseih packet lost");
            break;
          case 1004:
            v12 = CFSTR("Sender died");
            break;
          case 1005:
            v12 = CFSTR("Initial full sync must happen first");
            break;
          case 1006:
            v12 = CFSTR("Deletions are not permitted for this client.");
            break;
          case 1007:
            v12 = CFSTR("There is a full-sync pending; please terminate this delta sync.");
            break;
          case 1008:
            v12 = CFSTR("No peer device is connected or available at this time.");
            break;
          default:
            if (a3 != -128)
              goto LABEL_43;
            v12 = CFSTR("Operation was canceled");
            break;
        }
LABEL_41:
        v14 = v9;
        v13 = v10;
LABEL_42:
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v13);
        break;
    }
  }
LABEL_43:
  v15 = objc_msgSend(a1, "initWithDomain:code:userInfo:", CFSTR("SYErrorDomain"), a3, v9);

  return v15;
}

@end
