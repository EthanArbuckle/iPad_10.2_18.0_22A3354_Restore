@implementation GEOAmenityItem(MUAmenityItemViewModel)

- (id)symbolImageForFont:()MUAmenityItemViewModel
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithFont:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1, "isAmenityPresent"))
  {
    v8 = CFSTR("xmark");
    goto LABEL_6;
  }
  objc_msgSend(a1, "symbolImageName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4
    || (v5 = (void *)MEMORY[0x1E0DC3870],
        objc_msgSend(a1, "symbolImageName"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v6, v2),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v8 = CFSTR("checkmark");
LABEL_6:
    objc_msgSend(MEMORY[0x1E0DC3870], "_mapsui_systemImageNamed:withConfiguration:", v8, v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)displayTitle
{
  void *v2;
  uint64_t v3;
  void *v4;
  int v5;
  __CFString *v6;
  int v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(a1, "amenityTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    objc_msgSend(a1, "amenityTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = objc_msgSend(a1, "amenityType") - 1;
    v6 = CFSTR("Accepts Credit Cards");
    switch(v5)
    {
      case 0:
        goto LABEL_69;
      case 1:
        v6 = CFSTR("Wheelchair Accessible");
        goto LABEL_69;
      case 2:
        v6 = CFSTR("Kid Friendly");
        goto LABEL_69;
      case 3:
        v6 = CFSTR("Delivery");
        goto LABEL_69;
      case 4:
        v6 = CFSTR("Pets Allowed");
        goto LABEL_69;
      case 5:
        v6 = CFSTR("Open 24 Hours");
        goto LABEL_69;
      case 6:
        v6 = CFSTR("Fitness Center");
        goto LABEL_69;
      case 7:
        v6 = CFSTR("Free Breakfast");
        goto LABEL_69;
      case 8:
        v6 = CFSTR("Spa");
        goto LABEL_69;
      case 9:
        v6 = CFSTR("Swimming Pool");
        goto LABEL_69;
      case 10:
        v7 = MGGetBoolAnswer();
        v8 = CFSTR("Wi-Fi");
        v9 = CFSTR("WLAN");
        goto LABEL_16;
      case 11:
        v7 = MGGetBoolAnswer();
        v8 = CFSTR("Free Wi-Fi");
        v9 = CFSTR("Free WLAN");
LABEL_16:
        if (v7)
          v6 = (__CFString *)v9;
        else
          v6 = (__CFString *)v8;
        goto LABEL_69;
      case 12:
        v6 = CFSTR("Free Internet");
        goto LABEL_69;
      case 13:
        v6 = CFSTR("Shuttle Service");
        goto LABEL_69;
      case 14:
        v6 = CFSTR("Airport Transportation");
        goto LABEL_69;
      case 15:
        v6 = CFSTR("Parking Available");
        goto LABEL_69;
      case 16:
        v6 = CFSTR("Parking Garage");
        goto LABEL_69;
      case 17:
        v6 = CFSTR("Free Parking");
        goto LABEL_69;
      case 18:
        v6 = CFSTR("Smoking Allowed");
        goto LABEL_69;
      case 19:
        v6 = CFSTR("Reservations");
        goto LABEL_69;
      case 20:
        v6 = CFSTR("Accepts Apple Pay");
        goto LABEL_69;
      case 21:
        v6 = CFSTR("Gender-Neutral Restrooms");
        goto LABEL_69;
      case 22:
        v6 = CFSTR("Takeout");
        goto LABEL_69;
      case 23:
        v6 = CFSTR("Appointment Only");
        goto LABEL_69;
      case 24:
        v6 = CFSTR("Good for Groups");
        goto LABEL_69;
      case 25:
        v6 = CFSTR("Scenic View");
        goto LABEL_69;
      case 26:
        v6 = CFSTR("Outdoor Seating");
        goto LABEL_69;
      case 27:
        v6 = CFSTR("Waterfront");
        goto LABEL_69;
      case 28:
        v6 = CFSTR("Beachfront");
        goto LABEL_69;
      case 29:
        v6 = CFSTR("Dogs Allowed");
        goto LABEL_69;
      case 30:
        v6 = CFSTR("Drive-through");
        goto LABEL_69;
      case 31:
        v6 = CFSTR("Full Bar");
        goto LABEL_69;
      case 32:
        v6 = CFSTR("Vegetarian Options");
        goto LABEL_69;
      case 33:
        v6 = CFSTR("Vegan Options");
        goto LABEL_69;
      case 34:
        v6 = CFSTR("Glutenfree Options");
        goto LABEL_69;
      case 35:
        v6 = CFSTR("Soy-free Options");
        goto LABEL_69;
      case 36:
        v6 = CFSTR("Halal Options");
        goto LABEL_69;
      case 37:
        v6 = CFSTR("Dairy-free Options");
        goto LABEL_69;
      case 38:
        v6 = CFSTR("Meeting Rooms");
        goto LABEL_69;
      case 39:
        v6 = CFSTR("Smoke-free property");
        goto LABEL_69;
      case 40:
        v6 = CFSTR("Non-smoking Rooms");
        goto LABEL_69;
      case 41:
        v6 = CFSTR("Family Rooms");
        goto LABEL_69;
      case 42:
        v6 = CFSTR("Bar / Lounge");
        goto LABEL_69;
      case 43:
        v6 = CFSTR("Restaurant");
        goto LABEL_69;
      case 44:
        v6 = CFSTR("Laundry Service");
        goto LABEL_69;
      case 45:
        v6 = CFSTR("Large Tables");
        goto LABEL_69;
      case 46:
        v6 = CFSTR("Private Rooms");
        goto LABEL_69;
      case 47:
        v6 = CFSTR("High Chairs");
        goto LABEL_69;
      case 48:
        v6 = CFSTR("Self Ordering Online");
        goto LABEL_69;
      case 49:
        v6 = CFSTR("Online Queuing");
        goto LABEL_69;
      case 50:
        v6 = CFSTR("Seating for Couples");
        goto LABEL_69;
      case 51:
        v6 = CFSTR("Children's Discount");
        goto LABEL_69;
      case 52:
        v6 = CFSTR("IMAX");
        goto LABEL_69;
      case 53:
        v6 = CFSTR("Device Trade-in for Credit");
        goto LABEL_69;
      case 54:
        v6 = CFSTR("Free Today at Apple Sessions");
        goto LABEL_69;
      case 55:
        v6 = CFSTR("Small Business Solutions");
        goto LABEL_69;
      case 56:
        v6 = CFSTR("Hardware Repairs and Support");
        goto LABEL_69;
      case 57:
        v6 = CFSTR("Genius Bar Walk-ins");
        goto LABEL_69;
      case 58:
        v6 = CFSTR("Apple Authorized Service Provider");
        goto LABEL_69;
      case 59:
        v6 = CFSTR("Offers Same Day iPhone Screen Repair");
        goto LABEL_69;
      case 60:
        v6 = CFSTR("Walk-in Repairs");
        goto LABEL_69;
      case 61:
        v6 = CFSTR("Apple Authorized Drop-off Location");
LABEL_69:
        _MULocalizedStringFromThisBundle(v6);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        v4 = 0;
        break;
    }
  }
  return v4;
}

@end
