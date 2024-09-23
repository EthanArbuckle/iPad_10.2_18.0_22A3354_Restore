@implementation AXMTABedtimeUtilities

+ (id)dayStringForRepeatSchedule:(unint64_t)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setMonth:", 1);
  objc_msgSend(v4, "setYear:", 2016);
  v5 = 0;
  if ((uint64_t)a3 > 15)
  {
    switch(a3)
    {
      case 0x10uLL:
        v6 = 8;
        break;
      case 0x20uLL:
        v6 = 9;
        break;
      case 0x40uLL:
        v6 = 10;
        break;
      default:
        goto LABEL_13;
    }
LABEL_12:
    objc_msgSend(v4, "setDay:", v6);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    AXDateStringForFormat();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v6 = 4;
  switch(a3)
  {
    case 1uLL:
      goto LABEL_12;
    case 2uLL:
      v6 = 5;
      goto LABEL_12;
    case 4uLL:
      v6 = 6;
      goto LABEL_12;
    case 8uLL:
      v6 = 7;
      goto LABEL_12;
    default:
      break;
  }
LABEL_13:

  return v5;
}

@end
