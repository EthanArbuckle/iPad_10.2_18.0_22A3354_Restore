@implementation CTSuppServicesNotificationData

- (id)callClassString
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData callClass](self, "callClass"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "intValue");
    v5 = &stru_100014540;
    if (v4 > 15)
    {
      if (v4 > 63)
      {
        if (v4 == 64)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
          v7 = v6;
          v8 = CFSTR("Packet Access");
        }
        else
        {
          if (v4 != 128)
            goto LABEL_19;
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
          v7 = v6;
          v8 = CFSTR("Pad Access");
        }
      }
      else if (v4 == 16)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v7 = v6;
        v8 = CFSTR("Sync Data Circuit");
      }
      else
      {
        if (v4 != 32)
          goto LABEL_19;
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v7 = v6;
        v8 = CFSTR("Async Data Circuit");
      }
LABEL_18:
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_100014540, CFSTR("SIMToolkitUI")));

      goto LABEL_19;
    }
    switch(v4)
    {
      case 1:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v7 = v6;
        v8 = CFSTR("Voice");
        goto LABEL_18;
      case 2:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v7 = v6;
        v8 = CFSTR("Data");
        goto LABEL_18;
      case 4:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v7 = v6;
        v8 = CFSTR("Fax");
        goto LABEL_18;
      case 8:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v7 = v6;
        v8 = CFSTR("SMS");
        goto LABEL_18;
      default:
        break;
    }
  }
  else
  {
    v5 = &stru_100014540;
  }
LABEL_19:

  return v5;
}

- (id)callForwardingReasonString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData callForwardingReason](self, "callForwardingReason"));
  v3 = v2;
  if (v2)
  {
    switch(objc_msgSend(v2, "intValue"))
    {
      case 0u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("On All Calls");
        break;
      case 1u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("When Busy");
        break;
      case 2u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("When Unanswered");
        break;
      case 3u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("When Unreachable");
        break;
      case 4u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("All Calls");
        break;
      case 5u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("All Conditional Calls");
        break;
      default:
        goto LABEL_4;
    }
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  else
  {
LABEL_4:
    v7 = &stru_100014540;
  }

  return v7;
}

- (id)callingLinePresentationString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData callingLinePresentation](self, "callingLinePresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData _linePresentationStringForValueNumber:](self, "_linePresentationStringForValueNumber:", v3));

  return v4;
}

- (id)connectedLinePresentationString
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData connectedLinePresentation](self, "connectedLinePresentation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData _linePresentationStringForValueNumber:](self, "_linePresentationStringForValueNumber:", v3));

  return v4;
}

- (id)_linePresentationStringForValueNumber:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    switch(objc_msgSend(v3, "intValue"))
    {
      case 0u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Disabled");
        break;
      case 1u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Enabled");
        break;
      case 2u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Not Available");
        break;
      case 3u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Unknown");
        break;
      default:
        goto LABEL_4;
    }
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  else
  {
LABEL_4:
    v8 = &stru_100014540;
  }

  return v8;
}

- (id)connectedLineIDRestrictionString
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData connectedLineIdRestriction](self, "connectedLineIdRestriction"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "intValue");
    switch(v4)
    {
      case 2u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Unknown");
        goto LABEL_9;
      case 1u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Available");
        goto LABEL_9;
      case 0u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Not Available");
LABEL_9:
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_100014540, CFSTR("SIMToolkitUI")));

        goto LABEL_10;
    }
  }
  v8 = &stru_100014540;
LABEL_10:

  return v8;
}

- (id)enabledString
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData enabled](self, "enabled"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v6 = v5;
    if (v4)
      v7 = CFSTR("Enabled");
    else
      v7 = CFSTR("Disabled");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  else
  {
    v8 = &stru_100014540;
  }

  return v8;
}

- (id)mmiProcedureString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData mmiProcedure](self, "mmiProcedure"));
  v3 = v2;
  if (v2)
  {
    switch(objc_msgSend(v2, "intValue"))
    {
      case 1u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Activation");
        break;
      case 2u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Deactivation");
        break;
      case 3u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Interrogation");
        break;
      case 4u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Registration");
        break;
      case 5u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Erasure");
        break;
      default:
        goto LABEL_4;
    }
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  else
  {
LABEL_4:
    v7 = &stru_100014540;
  }

  return v7;
}

- (id)ssServiceTypeString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData supplementaryServiceType](self, "supplementaryServiceType"));
  if (!v2
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService"))), v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Type %d"), &stru_100014540, CFSTR("SIMToolkitUI"))), v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, objc_msgSend(v2, "intValue"))), v4, v3,
        !v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("No Service Specified"), &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  return v5;
}

- (id)callingNamePresentationString
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData callingNamePresentation](self, "callingNamePresentation"));
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "intValue");
    switch(v4)
    {
      case 2u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Unknown");
        goto LABEL_9;
      case 1u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Enabled");
        goto LABEL_9;
      case 0u:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v6 = v5;
        v7 = CFSTR("Disabled");
LABEL_9:
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_100014540, CFSTR("SIMToolkitUI")));

        goto LABEL_10;
    }
  }
  v8 = &stru_100014540;
LABEL_10:

  return v8;
}

- (id)callBarringFacilityString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData callBarringFacility](self, "callBarringFacility"));
  v3 = v2;
  if (v2)
  {
    switch(objc_msgSend(v2, "intValue"))
    {
      case 0u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("All Outgoing");
        break;
      case 1u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Outgoing International");
        break;
      case 2u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Outgoing International, Except Home Country");
        break;
      case 3u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("All Incoming");
        break;
      case 4u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Incoming While Roaming Outside Home Country");
        break;
      case 5u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Incoming, Not On SIM");
        break;
      case 6u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("All Services");
        break;
      case 7u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("All Outgoing Services");
        break;
      case 8u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("All Incoming Services");
        break;
      default:
        goto LABEL_4;
    }
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  else
  {
LABEL_4:
    v7 = &stru_100014540;
  }

  return v7;
}

- (id)callingLineIDRestrictionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CTSuppServicesNotificationData callingLineIdRestriction](self, "callingLineIdRestriction"));
  v3 = v2;
  if (v2)
  {
    switch(objc_msgSend(v2, "intValue"))
    {
      case 0u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Disabled");
        break;
      case 1u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Enabled");
        break;
      case 2u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Network Controlled");
        break;
      case 3u:
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
        v5 = v4;
        v6 = CFSTR("Unknown");
        break;
      default:
        goto LABEL_4;
    }
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_100014540, CFSTR("SIMToolkitUI")));

  }
  else
  {
LABEL_4:
    v7 = &stru_100014540;
  }

  return v7;
}

@end
