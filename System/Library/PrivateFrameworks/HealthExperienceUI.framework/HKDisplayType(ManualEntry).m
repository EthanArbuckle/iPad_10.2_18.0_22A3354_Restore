@implementation HKDisplayType(ManualEntry)

- (id)wd_addDataViewControllerClass
{
  objc_msgSend(a1, "displayTypeIdentifier");
  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)wd_valueOrderForAddDataViewController
{
  uint64_t v1;
  uint64_t v2;
  void *result;

  v1 = objc_msgSend(a1, "displayTypeIdentifier");
  if (v1 <= 94)
  {
    switch(v1)
    {
      case '?':
        return &unk_1E55CD4F0;
      case '[':
        return &unk_1E55CD430;
      case '\\':
        return &unk_1E55CD4A8;
      default:
        return (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    v2 = v1 - 157;
    result = &unk_1E55CD3E8;
    switch(v2)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 83:
      case 84:
      case 85:
        return result;
      case 7:
      case 12:
        result = &unk_1E55CD490;
        break;
      case 13:
        result = &unk_1E55CD400;
        break;
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 70:
      case 71:
      case 80:
      case 81:
      case 82:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
        return (void *)MEMORY[0x1E0C9AA60];
      case 21:
        result = &unk_1E55CD448;
        break;
      case 79:
        result = &unk_1E55CD460;
        break;
      case 86:
        result = &unk_1E55CD4C0;
        break;
      case 87:
        result = &unk_1E55CD4D8;
        break;
      case 93:
        result = &unk_1E55CD418;
        break;
      default:
        if (&unk_1E55CD3E8 != (_UNKNOWN *)95 && &unk_1E55CD3E8 != (_UNKNOWN *)314)
          return (void *)MEMORY[0x1E0C9AA60];
        result = &unk_1E55CD478;
        break;
    }
  }
  return result;
}

- (void)wd_defaultValueForAddDataViewController
{
  uint64_t v1;
  void *result;

  v1 = objc_msgSend(a1, "displayTypeIdentifier") - 157;
  result = 0;
  switch(v1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 63:
    case 64:
    case 65:
    case 66:
    case 67:
    case 68:
    case 69:
    case 72:
    case 73:
    case 74:
    case 75:
    case 76:
    case 77:
    case 78:
    case 83:
    case 84:
    case 85:
      result = &unk_1E55CCF50;
      break;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 60:
    case 61:
    case 62:
    case 70:
    case 71:
    case 79:
    case 80:
    case 81:
    case 82:
      return result;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
