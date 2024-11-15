@implementation CCTypeIdentifierRegistry

+ (Class)itemMessageSubclassForIdentifier:(unsigned __int16)a3
{
  void *v3;
  int v4;
  int v5;

  v3 = 0;
  if ((int)a3 > 25882)
  {
    if ((int)a3 > 46119)
    {
      if ((int)a3 <= 53603)
      {
        if ((int)a3 <= 47340)
        {
          switch(a3)
          {
            case 0xB428u:
            case 0xB429u:
            case 0xB42Au:
            case 0xB42Bu:
            case 0xB42Cu:
            case 0xB42Du:
            case 0xB42Eu:
            case 0xB42Fu:
            case 0xB430u:
            case 0xB431u:
            case 0xB432u:
            case 0xB433u:
            case 0xB434u:
              goto LABEL_97;
            default:
              return (Class)v3;
          }
        }
        else if ((int)a3 <= 49065)
        {
          switch(a3)
          {
            case 0xB8EDu:
            case 0xB8EFu:
            case 0xB8F0u:
            case 0xB8F1u:
            case 0xB8F3u:
            case 0xB8F4u:
            case 0xB8F5u:
            case 0xB8F8u:
            case 0xB8F9u:
            case 0xB8FAu:
            case 0xB8FBu:
              goto LABEL_97;
            default:
              return (Class)v3;
          }
        }
        else
        {
          switch(a3)
          {
            case 0xBFAAu:
            case 0xBFADu:
            case 0xBFAEu:
            case 0xBFAFu:
            case 0xBFB0u:
            case 0xBFB1u:
            case 0xBFB2u:
              goto LABEL_97;
            case 0xBFABu:
            case 0xBFACu:
              return (Class)v3;
            default:
              switch(a3)
              {
                case 0xD0EAu:
                case 0xD0EDu:
                case 0xD0EEu:
                case 0xD0EFu:
                  goto LABEL_97;
                case 0xD0EBu:
                case 0xD0ECu:
                  return (Class)v3;
                default:
                  if (a3 == 53601)
                    goto LABEL_97;
                  break;
              }
              break;
          }
        }
      }
      else if ((int)a3 > 61351)
      {
        if ((int)a3 <= 62157)
        {
          switch(a3)
          {
            case 0xEFA8u:
            case 0xEFABu:
            case 0xEFACu:
            case 0xEFADu:
              goto LABEL_97;
            case 0xEFA9u:
            case 0xEFAAu:
              return (Class)v3;
            default:
              switch(a3)
              {
                case 0xF045u:
                case 0xF048u:
                case 0xF049u:
                case 0xF04Au:
                  goto LABEL_97;
                default:
                  return (Class)v3;
              }
          }
        }
        else
        {
          switch(a3)
          {
            case 0xF2CEu:
            case 0xF2CFu:
            case 0xF2D0u:
            case 0xF2D1u:
            case 0xF2D2u:
            case 0xF2D3u:
            case 0xF2D4u:
            case 0xF2D5u:
              goto LABEL_97;
            default:
              switch(a3)
              {
                case 0xF789u:
                case 0xF78Cu:
                case 0xF78Du:
                case 0xF78Eu:
                  goto LABEL_97;
                default:
                  return (Class)v3;
              }
          }
        }
      }
      else if ((int)a3 <= 56509)
      {
        switch(a3)
        {
          case 0xD164u:
          case 0xD165u:
          case 0xD166u:
          case 0xD16Eu:
          case 0xD171u:
          case 0xD172u:
            goto LABEL_97;
          case 0xD167u:
          case 0xD168u:
          case 0xD169u:
          case 0xD16Au:
          case 0xD16Bu:
          case 0xD16Cu:
          case 0xD16Du:
          case 0xD16Fu:
          case 0xD170u:
            return (Class)v3;
          default:
            switch(a3)
            {
              case 0xD471u:
              case 0xD474u:
              case 0xD475u:
              case 0xD476u:
                goto LABEL_97;
              default:
                return (Class)v3;
            }
        }
      }
      else
      {
        switch(a3)
        {
          case 0xDCBEu:
          case 0xDCBFu:
          case 0xDCC0u:
          case 0xDCC1u:
          case 0xDCC2u:
          case 0xDCC3u:
          case 0xDCC4u:
            goto LABEL_97;
          default:
            switch(a3)
            {
              case 0xE928u:
              case 0xE929u:
              case 0xE92Au:
              case 0xE92Bu:
                goto LABEL_97;
              default:
                return (Class)v3;
            }
        }
      }
    }
    else if ((int)a3 > 38250)
    {
      if ((int)a3 > 42610)
      {
        switch(a3)
        {
          case 0xA673u:
          case 0xA674u:
          case 0xA675u:
          case 0xA676u:
          case 0xA677u:
          case 0xA678u:
          case 0xA679u:
          case 0xA67Au:
          case 0xA67Bu:
          case 0xA67Cu:
          case 0xA67Du:
          case 0xA67Eu:
            goto LABEL_97;
          default:
            switch(a3)
            {
              case 0xAF87u:
              case 0xAF8Au:
              case 0xAF8Bu:
              case 0xAF8Cu:
                goto LABEL_97;
              default:
                return (Class)v3;
            }
        }
      }
      else
      {
        switch(a3)
        {
          case 0x9E78u:
          case 0x9E79u:
          case 0x9E7Au:
          case 0x9E7Bu:
          case 0x9E7Cu:
          case 0x9E7Du:
          case 0x9E7Eu:
          case 0x9E7Fu:
          case 0x9E80u:
            goto LABEL_97;
          default:
            switch(a3)
            {
              case 0xA4C8u:
              case 0xA4C9u:
              case 0xA4CAu:
              case 0xA4CBu:
              case 0xA4CCu:
              case 0xA4CDu:
              case 0xA4CEu:
                goto LABEL_97;
              default:
                switch(a3)
                {
                  case 0x956Bu:
                  case 0x956Eu:
                  case 0x956Fu:
                  case 0x9570u:
                    goto LABEL_97;
                  default:
                    return (Class)v3;
                }
            }
        }
      }
    }
    else if ((int)a3 > 32964)
    {
      if ((int)a3 > 36062)
      {
        switch(a3)
        {
          case 0x8E52u:
          case 0x8E55u:
          case 0x8E56u:
          case 0x8E57u:
          case 0x8E58u:
          case 0x8E59u:
          case 0x8E5Au:
          case 0x8E5Bu:
          case 0x8E5Cu:
          case 0x8E5Du:
          case 0x8E5Eu:
            goto LABEL_97;
          case 0x8E53u:
          case 0x8E54u:
            return (Class)v3;
          default:
            if (a3 == 36063)
              goto LABEL_97;
            v4 = 36064;
            goto LABEL_85;
        }
      }
      if ((int)a3 > 34306)
      {
        if ((int)a3 <= 34311)
        {
          if (a3 != 34307 && a3 != 34311)
            return (Class)v3;
          goto LABEL_97;
        }
        if (a3 == 34312)
          goto LABEL_97;
        v4 = 36059;
LABEL_85:
        if (a3 == v4)
          goto LABEL_97;
      }
      else
      {
        switch(a3)
        {
          case 0x80C5u:
          case 0x80C8u:
          case 0x80C9u:
          case 0x80CAu:
            goto LABEL_97;
          default:
            return (Class)v3;
        }
      }
    }
    else if ((int)a3 > 29396)
    {
      switch(a3)
      {
        case 0x7786u:
        case 0x7789u:
        case 0x778Au:
        case 0x778Bu:
          goto LABEL_97;
        case 0x7787u:
        case 0x7788u:
          return (Class)v3;
        default:
          if ((a3 - 29397) < 3 || a3 == 29400)
            goto LABEL_97;
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x69F2u:
        case 0x69F6u:
        case 0x69F7u:
        case 0x69F8u:
        case 0x69FBu:
        case 0x69FCu:
          goto LABEL_97;
        case 0x69F3u:
        case 0x69F4u:
        case 0x69F5u:
        case 0x69F9u:
        case 0x69FAu:
          return (Class)v3;
        default:
          switch(a3)
          {
            case 0x651Bu:
            case 0x651Eu:
            case 0x651Fu:
            case 0x6520u:
              goto LABEL_97;
            case 0x651Cu:
            case 0x651Du:
              return (Class)v3;
            default:
              switch(a3)
              {
                case 0x6790u:
                case 0x6793u:
                case 0x6794u:
                case 0x6795u:
                  goto LABEL_97;
                default:
                  return (Class)v3;
              }
          }
      }
    }
  }
  else
  {
    if ((int)a3 <= 16250)
    {
      if ((int)a3 <= 12995)
      {
        if ((int)a3 > 7821)
        {
          if ((int)a3 > 8197)
          {
            switch(a3)
            {
              case 0x2EEAu:
              case 0x2EEDu:
              case 0x2EEEu:
              case 0x2EEFu:
              case 0x2EF0u:
                goto LABEL_97;
              case 0x2EEBu:
              case 0x2EECu:
                return (Class)v3;
              default:
                if (a3 == 8198)
                  goto LABEL_97;
                v5 = 8199;
                goto LABEL_94;
            }
          }
          switch(a3)
          {
            case 0x1E8Eu:
            case 0x1E91u:
            case 0x1E92u:
            case 0x1E93u:
            case 0x1E94u:
            case 0x1E95u:
            case 0x1E96u:
              goto LABEL_97;
            case 0x1E8Fu:
            case 0x1E90u:
              return (Class)v3;
            default:
              v5 = 8194;
LABEL_94:
              if (a3 == v5)
                goto LABEL_97;
              break;
          }
        }
        else if ((int)a3 <= 3619)
        {
          switch(a3)
          {
            case 0x320u:
            case 0x323u:
            case 0x324u:
            case 0x325u:
              goto LABEL_97;
            case 0x321u:
            case 0x322u:
              return (Class)v3;
            default:
              if (a3 == 3615 || a3 == 3619)
                goto LABEL_97;
              break;
          }
        }
        else
        {
          switch(a3)
          {
            case 0x1E0Au:
            case 0x1E0Bu:
            case 0x1E0Cu:
            case 0x1E0Du:
            case 0x1E0Eu:
            case 0x1E0Fu:
            case 0x1E10u:
            case 0x1E11u:
            case 0x1E12u:
            case 0x1E13u:
            case 0x1E14u:
            case 0x1E15u:
            case 0x1E16u:
            case 0x1E17u:
            case 0x1E18u:
            case 0x1E19u:
            case 0x1E1Au:
            case 0x1E1Bu:
            case 0x1E1Cu:
            case 0x1E1Du:
            case 0x1E1Eu:
            case 0x1E27u:
            case 0x1E2Au:
            case 0x1E2Bu:
            case 0x1E2Cu:
              goto LABEL_97;
            case 0x1E1Fu:
            case 0x1E20u:
            case 0x1E21u:
            case 0x1E22u:
            case 0x1E23u:
            case 0x1E24u:
            case 0x1E25u:
            case 0x1E26u:
            case 0x1E28u:
            case 0x1E29u:
              return (Class)v3;
            default:
              switch(a3)
              {
                case 0x15DBu:
                case 0x15DEu:
                case 0x15DFu:
                case 0x15E0u:
                  goto LABEL_97;
                case 0x15DCu:
                case 0x15DDu:
                  return (Class)v3;
                default:
                  if (a3 == 3620)
                    goto LABEL_97;
                  break;
              }
              break;
          }
        }
        return (Class)v3;
      }
      if ((int)a3 > 14815)
      {
        switch(a3)
        {
          case 0x3D8Du:
          case 0x3D92u:
          case 0x3D93u:
          case 0x3D98u:
          case 0x3D99u:
          case 0x3D9Au:
          case 0x3D9Bu:
          case 0x3D9Cu:
          case 0x3D9Du:
          case 0x3D9Eu:
          case 0x3D9Fu:
          case 0x3DA0u:
          case 0x3DA1u:
          case 0x3DA2u:
          case 0x3DA3u:
          case 0x3DA4u:
          case 0x3DA5u:
          case 0x3DA6u:
          case 0x3DA7u:
          case 0x3DA8u:
          case 0x3DA9u:
          case 0x3DAAu:
          case 0x3DABu:
          case 0x3DACu:
          case 0x3DADu:
            goto LABEL_97;
          case 0x3D8Eu:
          case 0x3D8Fu:
          case 0x3D90u:
          case 0x3D91u:
          case 0x3D94u:
          case 0x3D95u:
          case 0x3D96u:
          case 0x3D97u:
            return (Class)v3;
          default:
            switch(a3)
            {
              case 0x39E0u:
              case 0x39E3u:
              case 0x39E4u:
              case 0x39E5u:
                goto LABEL_97;
              case 0x39E1u:
              case 0x39E2u:
                return (Class)v3;
              default:
                switch(a3)
                {
                  case 0x3CD4u:
                  case 0x3CD7u:
                  case 0x3CD8u:
                  case 0x3CD9u:
                    goto LABEL_97;
                  default:
                    return (Class)v3;
                }
            }
        }
        return (Class)v3;
      }
      if ((int)a3 <= 14024)
      {
        switch(a3)
        {
          case 0x32C4u:
          case 0x32C7u:
          case 0x32C8u:
          case 0x32C9u:
            goto LABEL_97;
          case 0x32C5u:
          case 0x32C6u:
            return (Class)v3;
          default:
            switch(a3)
            {
              case 0x363Cu:
              case 0x363Fu:
              case 0x3640u:
              case 0x3641u:
                goto LABEL_97;
              default:
                return (Class)v3;
            }
        }
        return (Class)v3;
      }
      if ((int)a3 > 14705)
      {
        switch(a3)
        {
          case 0x3972u:
          case 0x3975u:
          case 0x3976u:
          case 0x3977u:
            goto LABEL_97;
          default:
            return (Class)v3;
        }
        return (Class)v3;
      }
      if (a3 != 14025 && a3 != 14029 && a3 != 14030)
        return (Class)v3;
LABEL_97:
      objc_opt_class();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return (Class)v3;
    }
    switch(a3)
    {
      case 0x4CD4u:
      case 0x4CDFu:
      case 0x4CE0u:
      case 0x4CE1u:
      case 0x4CE2u:
      case 0x4CE3u:
      case 0x4CE4u:
      case 0x4CE5u:
      case 0x4CE6u:
      case 0x4CE7u:
      case 0x4CE8u:
      case 0x4CE9u:
      case 0x4CEAu:
      case 0x4CEBu:
      case 0x4CECu:
      case 0x4CEDu:
      case 0x4CEEu:
      case 0x4CEFu:
      case 0x4CF0u:
      case 0x4CF1u:
      case 0x4CF2u:
      case 0x4CF3u:
      case 0x4CF4u:
      case 0x4CF5u:
      case 0x4CF6u:
      case 0x4CF8u:
      case 0x4CF9u:
      case 0x4D01u:
      case 0x4D16u:
      case 0x4D17u:
      case 0x4D18u:
      case 0x4D19u:
      case 0x4D1Au:
      case 0x4D1Bu:
      case 0x4D1Cu:
      case 0x4D20u:
      case 0x4D21u:
      case 0x4D22u:
      case 0x4D23u:
      case 0x4D24u:
      case 0x4D25u:
      case 0x4D26u:
      case 0x4D27u:
      case 0x4D28u:
      case 0x4D29u:
      case 0x4D2Au:
      case 0x4D2Bu:
      case 0x4D2Cu:
      case 0x4D2Du:
      case 0x4D2Eu:
      case 0x4D2Fu:
      case 0x4D30u:
      case 0x4D31u:
      case 0x4D32u:
      case 0x4D33u:
      case 0x4D34u:
      case 0x4D35u:
      case 0x4D37u:
      case 0x4D39u:
      case 0x4D3Du:
      case 0x4D3Eu:
      case 0x4D3Fu:
      case 0x4D40u:
      case 0x4D41u:
        goto LABEL_97;
      case 0x4CD5u:
      case 0x4CD6u:
      case 0x4CD7u:
      case 0x4CD8u:
      case 0x4CD9u:
      case 0x4CDAu:
      case 0x4CDBu:
      case 0x4CDCu:
      case 0x4CDDu:
      case 0x4CDEu:
      case 0x4CF7u:
      case 0x4CFAu:
      case 0x4CFBu:
      case 0x4CFCu:
      case 0x4CFDu:
      case 0x4CFEu:
      case 0x4CFFu:
      case 0x4D00u:
      case 0x4D02u:
      case 0x4D03u:
      case 0x4D04u:
      case 0x4D05u:
      case 0x4D06u:
      case 0x4D07u:
      case 0x4D08u:
      case 0x4D09u:
      case 0x4D0Au:
      case 0x4D0Bu:
      case 0x4D0Cu:
      case 0x4D0Du:
      case 0x4D0Eu:
      case 0x4D0Fu:
      case 0x4D10u:
      case 0x4D11u:
      case 0x4D12u:
      case 0x4D13u:
      case 0x4D14u:
      case 0x4D15u:
      case 0x4D1Du:
      case 0x4D1Eu:
      case 0x4D1Fu:
      case 0x4D36u:
      case 0x4D38u:
      case 0x4D3Au:
      case 0x4D3Bu:
      case 0x4D3Cu:
        return (Class)v3;
      default:
        switch(a3)
        {
          case 0x486Cu:
          case 0x486Du:
          case 0x486Eu:
          case 0x486Fu:
          case 0x4870u:
          case 0x4871u:
          case 0x4872u:
          case 0x4873u:
          case 0x4874u:
          case 0x4875u:
          case 0x4876u:
          case 0x4877u:
          case 0x4878u:
          case 0x4879u:
          case 0x487Au:
          case 0x487Bu:
          case 0x487Cu:
          case 0x487Du:
          case 0x487Eu:
          case 0x487Fu:
          case 0x4880u:
          case 0x4881u:
          case 0x4882u:
          case 0x4883u:
          case 0x4884u:
          case 0x4885u:
          case 0x4886u:
          case 0x4887u:
          case 0x4888u:
            goto LABEL_97;
          default:
            switch(a3)
            {
              case 0x3F7Bu:
              case 0x3F7Eu:
              case 0x3F7Fu:
              case 0x3F80u:
                goto LABEL_97;
              default:
                return (Class)v3;
            }
        }
    }
  }
  return (Class)v3;
}

+ (id)setIdentifierForItemType:(unsigned __int16)a3
{
  int v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  BOOL v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  int v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;

  if ((int)a3 > 30597)
  {
    if ((int)a3 > 47340)
    {
      if ((int)a3 > 56509)
      {
        v3 = 61508;
        v4 = CFSTR("UserAccount.Identity");
        v19 = CFSTR("App.IntentVocabulary.CustomContactGroupName");
        if (a3 != 63369)
          v19 = 0;
        if (a3 == 62158)
          v20 = CFSTR("Siri.PrivateLearning.Media");
        else
          v20 = v19;
        if (a3 != 61509)
          v4 = v20;
        v7 = 56510;
        v8 = CFSTR("Siri.CompanionContext.Audio");
        v9 = CFSTR("Photos.PetRelationship");
        v10 = 59688;
        v11 = a3 == 61352;
        v12 = CFSTR("App.IntentVocabulary.CustomContactName");
      }
      else
      {
        v3 = 53600;
        v4 = CFSTR("Siri.PrivateLearning.Contact");
        v5 = CFSTR("Calendar.Event");
        if (a3 != 54385)
          v5 = 0;
        if (a3 == 53614)
          v6 = CFSTR("Fitness.Guest");
        else
          v6 = v5;
        if (a3 != 53601)
          v4 = v6;
        v7 = 47341;
        v8 = CFSTR("App.Intents.IndexedEntity");
        v9 = CFSTR("CarPlay.RadioStation");
        v10 = 49066;
        v11 = a3 == 53482;
        v12 = CFSTR("App.IntentVocabulary.CustomPhotoAlbumName");
      }
LABEL_48:
      if (!v11)
        v12 = 0;
      if (a3 != v10)
        v9 = v12;
      goto LABEL_85;
    }
    if ((int)a3 > 38250)
    {
      v3 = 42610;
      v4 = CFSTR("App.Intents.IndexedEnum");
      v15 = CFSTR("Wallet.Pass");
      if (a3 != 46120)
        v15 = 0;
      if (a3 == 44935)
        v16 = CFSTR("App.IntentVocabulary.CustomWorkoutActivityName");
      else
        v16 = v15;
      if (a3 != 42611)
        v4 = v16;
      v7 = 38251;
      v8 = CFSTR("App.IntentVocabulary.CustomMediaAudiobookAuthorName");
      v9 = CFSTR("PeopleSuggester.ContactPrior");
      v10 = 40568;
      v11 = a3 == 42184;
      v12 = CFSTR("Podcasts.Podcast");
      goto LABEL_48;
    }
    v3 = 34306;
    v25 = CFSTR("App.IntentVocabulary.GlobalMediaShowTitle");
    v26 = CFSTR("App.InstalledApp");
    if (a3 != 36434)
      v26 = 0;
    if (a3 != 36059)
      v25 = v26;
    if (a3 == 34307)
      v4 = CFSTR("App.IntentVocabulary.GlobalMediaPlaylistTitle");
    else
      v4 = v25;
    v7 = 30598;
    v8 = CFSTR("App.IntentVocabulary.CustomVoiceCommandName");
    v27 = 32965;
    v28 = CFSTR("App.IntentVocabulary.CustomMediaPlaylistTitle");
LABEL_82:
    if (a3 == v27)
      v9 = v28;
    else
      v9 = 0;
LABEL_85:
    if (a3 == v7)
      v23 = v8;
    else
      v23 = v9;
    goto LABEL_88;
  }
  if ((int)a3 > 14705)
  {
    if ((int)a3 > 18539)
    {
      v3 = 26511;
      v4 = CFSTR("App.IntentVocabulary.CustomNotebookItemTitle");
      v17 = CFSTR("ToolKitToolDefinition");
      if (a3 != 29397)
        v17 = 0;
      if (a3 == 27122)
        v18 = CFSTR("FindMy.Device");
      else
        v18 = v17;
      if (a3 != 26512)
        v4 = v18;
      v7 = 18540;
      v8 = CFSTR("MediaLibrary.Media");
      v9 = CFSTR("Contacts.Contact");
      v10 = 19668;
      v11 = a3 == 25883;
      v12 = CFSTR("App.IntentVocabulary.CustomPaymentsAccountNickname");
      goto LABEL_48;
    }
    v3 = 15571;
    v29 = CFSTR("Location.SignificantLocation");
    v30 = CFSTR("App.IntentVocabulary.CustomPaymentsOrganizationName");
    if (a3 != 16251)
      v30 = 0;
    if (a3 != 15757)
      v29 = v30;
    if (a3 == 15572)
      v4 = CFSTR("App.IntentVocabulary.CustomMediaShowTitle");
    else
      v4 = v29;
    v7 = 14706;
    v8 = CFSTR("App.IntentVocabulary.CustomMediaAudiobookTitle");
    v27 = 14816;
    v28 = CFSTR("App.IntentVocabulary.CustomCarProfileName");
    goto LABEL_82;
  }
  if ((int)a3 > 7821)
  {
    v3 = 12995;
    v4 = CFSTR("Health.Medication");
    v13 = CFSTR("App.IntentVocabulary.GlobalMediaAudiobookAuthor");
    if (a3 != 14025)
      v13 = 0;
    if (a3 == 13884)
      v14 = CFSTR("App.IntentVocabulary.CustomPhotoTag");
    else
      v14 = v13;
    if (a3 != 12996)
      v4 = v14;
    v7 = 7822;
    v8 = CFSTR("App.Shortcut.Entity");
    v9 = CFSTR("App.IntentVocabulary.GlobalMediaAudiobookTitle");
    v10 = 8194;
    v11 = a3 == 12010;
    v12 = CFSTR("App.Shortcut.Phrase");
    goto LABEL_48;
  }
  v3 = 5594;
  v21 = CFSTR("App.IntentVocabulary.CustomMediaMusicArtistName");
  if (a3 != 7719)
    v21 = 0;
  if (a3 == 7690)
    v22 = CFSTR("HomeKit.Home");
  else
    v22 = v21;
  if (a3 == 5595)
    v4 = CFSTR("App.IntentVocabulary.CustomNotebookItemGroupName");
  else
    v4 = v22;
  v23 = CFSTR("App.IntentVocabulary.CustomCarName");
  v24 = CFSTR("App.IntentVocabulary.GlobalMediaMusicArtistName");
  if (a3 != 3615)
    v24 = 0;
  if (a3 != 800)
    v23 = v24;
LABEL_88:
  if (a3 <= v3)
    return (id)v23;
  else
    return (id)v4;
}

+ (Class)itemMessageSubclassForItemType:(unsigned __int16)a3
{
  void *v3;

  v3 = 0;
  if ((int)a3 <= 30597)
  {
    if ((int)a3 > 14705)
    {
      if ((int)a3 <= 18539)
      {
        if ((int)a3 <= 15571)
        {
          if (a3 == 14706 || a3 == 14816)
            goto LABEL_76;
        }
        else if (a3 == 15572 || a3 == 15757 || a3 == 16251)
        {
          goto LABEL_76;
        }
      }
      else if ((int)a3 > 26511)
      {
        if (a3 == 26512 || a3 == 27122 || a3 == 29397)
          goto LABEL_76;
      }
      else if (a3 == 18540 || a3 == 19668 || a3 == 25883)
      {
        goto LABEL_76;
      }
    }
    else if ((int)a3 <= 7821)
    {
      if ((int)a3 <= 5594)
      {
        if (a3 == 800 || a3 == 3615)
          goto LABEL_76;
      }
      else if (a3 == 5595 || a3 == 7690 || a3 == 7719)
      {
        goto LABEL_76;
      }
    }
    else if ((int)a3 > 12995)
    {
      if (a3 == 12996 || a3 == 13884 || a3 == 14025)
        goto LABEL_76;
    }
    else if (a3 == 7822 || a3 == 8194 || a3 == 12010)
    {
      goto LABEL_76;
    }
  }
  else if ((int)a3 <= 47340)
  {
    if ((int)a3 <= 38250)
    {
      if ((int)a3 <= 34306)
      {
        if (a3 == 30598 || a3 == 32965)
          goto LABEL_76;
      }
      else if (a3 == 34307 || a3 == 36059 || a3 == 36434)
      {
        goto LABEL_76;
      }
    }
    else if ((int)a3 > 42610)
    {
      if (a3 == 42611 || a3 == 44935 || a3 == 46120)
        goto LABEL_76;
    }
    else if (a3 == 38251 || a3 == 40568 || a3 == 42184)
    {
      goto LABEL_76;
    }
  }
  else if ((int)a3 > 56509)
  {
    if ((int)a3 > 61508)
    {
      if (a3 == 61509 || a3 == 62158 || a3 == 63369)
        goto LABEL_76;
    }
    else if (a3 == 56510 || a3 == 59688 || a3 == 61352)
    {
      goto LABEL_76;
    }
  }
  else if ((int)a3 > 53600)
  {
    if (a3 == 53601 || a3 == 53614 || a3 == 54385)
      goto LABEL_76;
  }
  else if (a3 == 47341 || a3 == 49066 || a3 == 53482)
  {
LABEL_76:
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (Class)v3;
}

+ (Class)itemMessageSubclassForFieldType:(unsigned __int16)a3
{
  void *v3;

  v3 = 0;
  if ((int)a3 > 25885)
  {
    if ((int)a3 <= 44939)
    {
      if ((int)a3 > 38253)
      {
        if ((int)a3 > 42611)
        {
          switch(a3)
          {
            case 0xA674u:
            case 0xA675u:
            case 0xA676u:
            case 0xA677u:
            case 0xA678u:
            case 0xA679u:
            case 0xA67Au:
            case 0xA67Bu:
            case 0xA67Cu:
            case 0xA67Du:
            case 0xA67Eu:
              goto LABEL_167;
            default:
              if (a3 == 44938 || a3 == 44939)
                goto LABEL_167;
              break;
          }
        }
        else
        {
          if ((int)a3 <= 40568)
          {
            if (a3 != 38254 && a3 != 38255 && a3 != 38256)
              return (Class)v3;
            goto LABEL_167;
          }
          switch(a3)
          {
            case 0x9E79u:
            case 0x9E7Au:
            case 0x9E7Bu:
            case 0x9E7Cu:
            case 0x9E7Du:
            case 0x9E7Eu:
            case 0x9E7Fu:
            case 0x9E80u:
              goto LABEL_167;
            default:
              switch(a3)
              {
                case 0xA4C9u:
                case 0xA4CAu:
                case 0xA4CBu:
                case 0xA4CCu:
                case 0xA4CDu:
                case 0xA4CEu:
                  goto LABEL_167;
                default:
                  return (Class)v3;
              }
          }
        }
      }
      else if ((int)a3 > 32967)
      {
        if ((int)a3 <= 36062)
        {
          if ((int)a3 > 32970 && a3 != 34311 && a3 != 34312)
            return (Class)v3;
          goto LABEL_167;
        }
        switch(a3)
        {
          case 0x8E55u:
          case 0x8E56u:
          case 0x8E57u:
          case 0x8E58u:
          case 0x8E59u:
          case 0x8E5Au:
          case 0x8E5Bu:
          case 0x8E5Cu:
          case 0x8E5Du:
          case 0x8E5Eu:
            goto LABEL_167;
          default:
            if (a3 == 36063 || a3 == 36064)
              goto LABEL_167;
            break;
        }
      }
      else
      {
        if ((int)a3 > 29397)
        {
          if ((int)a3 > 30600)
          {
            if (a3 != 30601 && a3 != 30602 && a3 != 30603)
              return (Class)v3;
          }
          else if ((a3 - 29398) >= 2 && a3 != 29400)
          {
            return (Class)v3;
          }
          goto LABEL_167;
        }
        if ((int)a3 <= 26515)
        {
          if ((int)a3 > 25888 && a3 != 26515)
            return (Class)v3;
          goto LABEL_167;
        }
        switch(a3)
        {
          case 0x69F6u:
          case 0x69F7u:
          case 0x69F8u:
          case 0x69FBu:
          case 0x69FCu:
            goto LABEL_167;
          case 0x69F9u:
          case 0x69FAu:
            return (Class)v3;
          default:
            if (a3 == 26516 || a3 == 26517)
              goto LABEL_167;
            break;
        }
      }
    }
    else if ((int)a3 <= 53603)
    {
      if ((int)a3 <= 47342)
      {
        switch(a3)
        {
          case 0xB429u:
          case 0xB42Au:
          case 0xB42Bu:
          case 0xB42Cu:
          case 0xB42Du:
          case 0xB42Eu:
          case 0xB42Fu:
          case 0xB430u:
          case 0xB431u:
          case 0xB432u:
          case 0xB433u:
          case 0xB434u:
            goto LABEL_167;
          default:
            if (a3 == 44940)
              goto LABEL_167;
            break;
        }
      }
      else if ((int)a3 > 49068)
      {
        if ((int)a3 > 53484)
        {
          if (a3 != 53485 && a3 != 53486 && a3 != 53487)
            return (Class)v3;
          goto LABEL_167;
        }
        switch(a3)
        {
          case 0xBFADu:
          case 0xBFAEu:
          case 0xBFAFu:
          case 0xBFB0u:
          case 0xBFB1u:
          case 0xBFB2u:
            goto LABEL_167;
          default:
            return (Class)v3;
        }
      }
      else
      {
        switch(a3)
        {
          case 0xB8EFu:
          case 0xB8F0u:
          case 0xB8F1u:
          case 0xB8F3u:
          case 0xB8F4u:
          case 0xB8F5u:
          case 0xB8F8u:
          case 0xB8F9u:
          case 0xB8FAu:
          case 0xB8FBu:
            goto LABEL_167;
          default:
            return (Class)v3;
        }
      }
    }
    else if ((int)a3 > 61354)
    {
      if ((int)a3 <= 62158)
      {
        if ((int)a3 > 61511)
        {
          if (a3 != 61512 && a3 != 61513 && a3 != 61514)
            return (Class)v3;
        }
        else if (a3 != 61355 && a3 != 61356 && a3 != 61357)
        {
          return (Class)v3;
        }
        goto LABEL_167;
      }
      if ((int)a3 > 63371)
      {
        if (a3 != 63372 && a3 != 63373 && a3 != 63374)
          return (Class)v3;
        goto LABEL_167;
      }
      switch(a3)
      {
        case 0xF2CFu:
        case 0xF2D0u:
        case 0xF2D1u:
        case 0xF2D2u:
        case 0xF2D3u:
        case 0xF2D4u:
        case 0xF2D5u:
          goto LABEL_167;
        default:
          return (Class)v3;
      }
    }
    else
    {
      if ((int)a3 <= 56510)
      {
        if ((int)a3 > 53617)
        {
          if ((int)a3 > 54388)
          {
            if (a3 != 54389 && a3 != 54390)
              return (Class)v3;
          }
          else if (a3 != 53618 && a3 != 54388)
          {
            return (Class)v3;
          }
        }
        else if ((int)a3 > 53606 && a3 != 53617)
        {
          return (Class)v3;
        }
        goto LABEL_167;
      }
      if ((int)a3 > 59688)
      {
        if (a3 != 59689 && a3 != 59690 && a3 != 59691)
          return (Class)v3;
        goto LABEL_167;
      }
      switch(a3)
      {
        case 0xDCBFu:
        case 0xDCC0u:
        case 0xDCC1u:
        case 0xDCC2u:
        case 0xDCC3u:
        case 0xDCC4u:
          goto LABEL_167;
        default:
          return (Class)v3;
      }
    }
  }
  else
  {
    if ((int)a3 > 16255)
    {
      switch(a3)
      {
        case 0x4CDFu:
        case 0x4CE0u:
        case 0x4CE1u:
        case 0x4CE2u:
        case 0x4CE3u:
        case 0x4CE4u:
        case 0x4CE5u:
        case 0x4CE6u:
        case 0x4CE7u:
        case 0x4CE8u:
        case 0x4CE9u:
        case 0x4CEAu:
        case 0x4CEBu:
        case 0x4CECu:
        case 0x4CEDu:
        case 0x4CEEu:
        case 0x4CEFu:
        case 0x4CF0u:
        case 0x4CF1u:
        case 0x4CF2u:
        case 0x4CF3u:
        case 0x4CF4u:
        case 0x4CF5u:
        case 0x4CF6u:
        case 0x4CF8u:
        case 0x4CF9u:
        case 0x4D01u:
        case 0x4D16u:
        case 0x4D17u:
        case 0x4D18u:
        case 0x4D19u:
        case 0x4D1Au:
        case 0x4D1Bu:
        case 0x4D1Cu:
        case 0x4D20u:
        case 0x4D21u:
        case 0x4D22u:
        case 0x4D23u:
        case 0x4D24u:
        case 0x4D25u:
        case 0x4D26u:
        case 0x4D27u:
        case 0x4D28u:
        case 0x4D29u:
        case 0x4D2Au:
        case 0x4D2Bu:
        case 0x4D2Cu:
        case 0x4D2Du:
        case 0x4D2Eu:
        case 0x4D2Fu:
        case 0x4D30u:
        case 0x4D31u:
        case 0x4D32u:
        case 0x4D33u:
        case 0x4D34u:
        case 0x4D35u:
        case 0x4D37u:
        case 0x4D39u:
        case 0x4D3Du:
        case 0x4D3Eu:
        case 0x4D3Fu:
        case 0x4D40u:
        case 0x4D41u:
          goto LABEL_167;
        case 0x4CF7u:
        case 0x4CFAu:
        case 0x4CFBu:
        case 0x4CFCu:
        case 0x4CFDu:
        case 0x4CFEu:
        case 0x4CFFu:
        case 0x4D00u:
        case 0x4D02u:
        case 0x4D03u:
        case 0x4D04u:
        case 0x4D05u:
        case 0x4D06u:
        case 0x4D07u:
        case 0x4D08u:
        case 0x4D09u:
        case 0x4D0Au:
        case 0x4D0Bu:
        case 0x4D0Cu:
        case 0x4D0Du:
        case 0x4D0Eu:
        case 0x4D0Fu:
        case 0x4D10u:
        case 0x4D11u:
        case 0x4D12u:
        case 0x4D13u:
        case 0x4D14u:
        case 0x4D15u:
        case 0x4D1Du:
        case 0x4D1Eu:
        case 0x4D1Fu:
        case 0x4D36u:
        case 0x4D38u:
        case 0x4D3Au:
        case 0x4D3Bu:
        case 0x4D3Cu:
          return (Class)v3;
        default:
          switch(a3)
          {
            case 0x486Du:
            case 0x486Eu:
            case 0x486Fu:
            case 0x4870u:
            case 0x4871u:
            case 0x4872u:
            case 0x4873u:
            case 0x4874u:
            case 0x4875u:
            case 0x4876u:
            case 0x4877u:
            case 0x4878u:
            case 0x4879u:
            case 0x487Au:
            case 0x487Bu:
            case 0x487Cu:
            case 0x487Du:
            case 0x487Eu:
            case 0x487Fu:
            case 0x4880u:
            case 0x4881u:
            case 0x4882u:
            case 0x4883u:
            case 0x4884u:
            case 0x4885u:
            case 0x4886u:
            case 0x4887u:
            case 0x4888u:
              goto LABEL_167;
            default:
              if (a3 == 16256)
                goto LABEL_167;
              break;
          }
          break;
      }
      return (Class)v3;
    }
    if ((int)a3 > 12998)
    {
      if ((int)a3 <= 15761)
      {
        if ((int)a3 <= 14708)
        {
          if ((int)a3 > 13887)
          {
            if ((int)a3 > 14028)
            {
              if (a3 != 14029 && a3 != 14030)
                return (Class)v3;
            }
            else if (a3 != 13888 && a3 != 13889)
            {
              return (Class)v3;
            }
          }
          else if ((int)a3 > 13001 && a3 != 13887)
          {
            return (Class)v3;
          }
        }
        else if ((int)a3 <= 14819)
        {
          if ((int)a3 >= 14712 && a3 != 14819)
            return (Class)v3;
        }
        else if ((int)a3 <= 15574)
        {
          if (a3 != 14820 && a3 != 14821)
            return (Class)v3;
        }
        else if (a3 != 15575 && a3 != 15576 && a3 != 15577)
        {
          return (Class)v3;
        }
        goto LABEL_167;
      }
      switch(a3)
      {
        case 0x3D92u:
        case 0x3D93u:
        case 0x3D98u:
        case 0x3D99u:
        case 0x3D9Au:
        case 0x3D9Bu:
        case 0x3D9Cu:
        case 0x3D9Du:
        case 0x3D9Eu:
        case 0x3D9Fu:
        case 0x3DA0u:
        case 0x3DA1u:
        case 0x3DA2u:
        case 0x3DA3u:
        case 0x3DA4u:
        case 0x3DA5u:
        case 0x3DA6u:
        case 0x3DA7u:
        case 0x3DA8u:
        case 0x3DA9u:
        case 0x3DAAu:
        case 0x3DABu:
        case 0x3DACu:
        case 0x3DADu:
          goto LABEL_167;
        case 0x3D94u:
        case 0x3D95u:
        case 0x3D96u:
        case 0x3D97u:
          return (Class)v3;
        default:
          if (a3 == 16254 || a3 == 16255)
            goto LABEL_167;
          break;
      }
    }
    else
    {
      if ((int)a3 <= 7824)
      {
        if ((int)a3 > 5598)
        {
          switch(a3)
          {
            case 0x1E0Bu:
            case 0x1E0Cu:
            case 0x1E0Du:
            case 0x1E0Eu:
            case 0x1E0Fu:
            case 0x1E10u:
            case 0x1E11u:
            case 0x1E12u:
            case 0x1E13u:
            case 0x1E14u:
            case 0x1E15u:
            case 0x1E16u:
            case 0x1E17u:
            case 0x1E18u:
            case 0x1E19u:
            case 0x1E1Au:
            case 0x1E1Bu:
            case 0x1E1Cu:
            case 0x1E1Du:
            case 0x1E1Eu:
            case 0x1E2Au:
            case 0x1E2Bu:
            case 0x1E2Cu:
              goto LABEL_167;
            case 0x1E1Fu:
            case 0x1E20u:
            case 0x1E21u:
            case 0x1E22u:
            case 0x1E23u:
            case 0x1E24u:
            case 0x1E25u:
            case 0x1E26u:
            case 0x1E27u:
            case 0x1E28u:
            case 0x1E29u:
              return (Class)v3;
            default:
              if (a3 == 5599 || a3 == 5600)
                goto LABEL_167;
              break;
          }
          return (Class)v3;
        }
        if ((int)a3 > 3618)
        {
          if (a3 != 3619 && a3 != 3620 && a3 != 5598)
            return (Class)v3;
        }
        else if (a3 != 803 && a3 != 804 && a3 != 805)
        {
          return (Class)v3;
        }
LABEL_167:
        objc_opt_class();
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        return (Class)v3;
      }
      if ((int)a3 > 8197)
      {
        switch(a3)
        {
          case 0x2EEDu:
          case 0x2EEEu:
          case 0x2EEFu:
          case 0x2EF0u:
            goto LABEL_167;
          default:
            if (a3 == 8198 || a3 == 8199)
              goto LABEL_167;
            break;
        }
      }
      else
      {
        switch(a3)
        {
          case 0x1E91u:
          case 0x1E92u:
          case 0x1E93u:
          case 0x1E94u:
          case 0x1E95u:
          case 0x1E96u:
            goto LABEL_167;
          default:
            return (Class)v3;
        }
      }
    }
  }
  return (Class)v3;
}

+ (unsigned)itemTypeForSetIdentifier:(id)a3
{
  id v3;
  unsigned __int16 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ToolKitToolDefinition")) & 1) != 0)
  {
    v4 = 29397;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.InstalledApp")) & 1) != 0)
  {
    v4 = -29102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Calendar.Event")) & 1) != 0)
  {
    v4 = -11151;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CarPlay.RadioStation")) & 1) != 0)
  {
    v4 = -16470;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Contacts.Contact")) & 1) != 0)
  {
    v4 = 19668;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FindMy.Device")) & 1) != 0)
  {
    v4 = 27122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fitness.Guest")) & 1) != 0)
  {
    v4 = -11922;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Health.Medication")) & 1) != 0)
  {
    v4 = 12996;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HomeKit.Home")) & 1) != 0)
  {
    v4 = 7690;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Location.SignificantLocation")) & 1) != 0)
  {
    v4 = 15757;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MediaLibrary.Media")) & 1) != 0)
  {
    v4 = 18540;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PeopleSuggester.ContactPrior")) & 1) != 0)
  {
    v4 = -24968;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Photos.PetRelationship")) & 1) != 0)
  {
    v4 = -5848;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Podcasts.Podcast")) & 1) != 0)
  {
    v4 = -23352;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserAccount.Identity")) & 1) != 0)
  {
    v4 = -4027;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Wallet.Pass")) & 1) != 0)
  {
    v4 = -19416;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomCarName")) & 1) != 0)
  {
    v4 = 800;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomCarProfileName")) & 1) != 0)
  {
    v4 = 14816;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomContactGroupName")) & 1) != 0)
  {
    v4 = -2167;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomContactName")) & 1) != 0)
  {
    v4 = -4184;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomMediaAudiobookAuthorName")) & 1) != 0)
  {
    v4 = -27285;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomMediaAudiobookTitle")) & 1) != 0)
  {
    v4 = 14706;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomMediaMusicArtistName")) & 1) != 0)
  {
    v4 = 7719;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomMediaPlaylistTitle")) & 1) != 0)
  {
    v4 = -32571;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomMediaShowTitle")) & 1) != 0)
  {
    v4 = 15572;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomNotebookItemGroupName")) & 1) != 0)
  {
    v4 = 5595;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomNotebookItemTitle")) & 1) != 0)
  {
    v4 = 26512;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomPaymentsAccountNickname")) & 1) != 0)
  {
    v4 = 25883;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomPaymentsOrganizationName")) & 1) != 0)
  {
    v4 = 16251;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomPhotoAlbumName")) & 1) != 0)
  {
    v4 = -12054;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomPhotoTag")) & 1) != 0)
  {
    v4 = 13884;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomVoiceCommandName")) & 1) != 0)
  {
    v4 = 30598;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.CustomWorkoutActivityName")) & 1) != 0)
  {
    v4 = -20601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.GlobalMediaAudiobookAuthor")) & 1) != 0)
  {
    v4 = 14025;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.GlobalMediaAudiobookTitle")) & 1) != 0)
  {
    v4 = 8194;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.GlobalMediaMusicArtistName")) & 1) != 0)
  {
    v4 = 3615;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.GlobalMediaPlaylistTitle")) & 1) != 0)
  {
    v4 = -31229;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.IntentVocabulary.GlobalMediaShowTitle")) & 1) != 0)
  {
    v4 = -29477;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.Intents.IndexedEntity")) & 1) != 0)
  {
    v4 = -18195;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.Intents.IndexedEnum")) & 1) != 0)
  {
    v4 = -22925;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.Shortcut.Entity")) & 1) != 0)
  {
    v4 = 7822;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("App.Shortcut.Phrase")) & 1) != 0)
  {
    v4 = 12010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Siri.CompanionContext.Audio")) & 1) != 0)
  {
    v4 = -9026;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Siri.PrivateLearning.Contact")) & 1) != 0)
  {
    v4 = -11935;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Siri.PrivateLearning.Media")))
  {
    v4 = -3378;
  }
  else
  {
    v4 = *MEMORY[0x24BE15620];
  }

  return v4;
}

@end
