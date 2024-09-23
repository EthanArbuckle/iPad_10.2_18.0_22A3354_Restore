@implementation AXSSKeyChord(AXEventRepresentation)

+ (id)keyChordWithEvent:()AXEventRepresentation
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  __CFString *v7;
  id v8;
  void *v9;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 10)
  {
    objc_msgSend(v3, "keyInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = objc_msgSend(v4, "keyCode");
      v7 = 0;
      switch(v6)
      {
        case 'L':
          v7 = CFSTR("⌦");
          break;
        case 'M':
        case 'N':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
          break;
        case 'O':
          v7 = CFSTR("→");
          break;
        case 'P':
          v7 = CFSTR("←");
          break;
        case 'Q':
          v7 = CFSTR("↓");
          break;
        case 'R':
          v7 = CFSTR("↑");
          break;
        case 'X':
          v7 = CFSTR("⌤");
          break;
        default:
          switch(v6)
          {
            case '(':
              v7 = CFSTR("⏎");
              break;
            case '*':
              v7 = CFSTR("⌫");
              break;
            case '+':
              v7 = CFSTR("⇥");
              break;
            case ',':
              v7 = CFSTR("␣");
              break;
            default:
              goto LABEL_17;
          }
          break;
      }
LABEL_17:
      if (-[__CFString length](v7, "length")
        || (objc_msgSend(v5, "unmodifiedInput"),
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            -[__CFString length](v7, "length") == 1))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "modifierState") & 1) != 0)
          objc_msgSend(v9, "addObject:", CFSTR("⌘"));
        if ((objc_msgSend(v5, "modifierState") & 2) != 0)
          objc_msgSend(v9, "addObject:", CFSTR("⌥"));
        if ((objc_msgSend(v5, "modifierState") & 4) != 0)
          objc_msgSend(v9, "addObject:", CFSTR("⌃"));
        if ((objc_msgSend(v5, "modifierState") & 8) != 0)
          objc_msgSend(v9, "addObject:", CFSTR("⇧"));
        if ((objc_msgSend(v5, "modifierState") & 0x10) != 0)
          objc_msgSend(v9, "addObject:", CFSTR("⇪"));
        if ((objc_msgSend(v5, "modifierState") & 0x40) != 0)
          objc_msgSend(v9, "addObject:", CFSTR("Fn"));
        objc_msgSend(MEMORY[0x1E0CF4900], "keyChordWithKeys:", v9);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)keyChordByUpdatingModifiersFromEvent:()AXEventRepresentation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E20];
  objc_msgSend(a1, "keys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "type") == 10
    || objc_msgSend(v4, "type") == 11
    || objc_msgSend(v4, "type") == 12)
  {
    objc_msgSend(v4, "keyInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((objc_msgSend(v8, "modifierState") & 1) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("⌘"));
      else
        objc_msgSend(v7, "removeObject:", CFSTR("⌘"));
      if ((objc_msgSend(v9, "modifierState") & 2) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("⌥"));
      else
        objc_msgSend(v7, "removeObject:", CFSTR("⌥"));
      if ((objc_msgSend(v9, "modifierState") & 4) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("⌃"));
      else
        objc_msgSend(v7, "removeObject:", CFSTR("⌃"));
      if ((objc_msgSend(v9, "modifierState") & 8) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("⇧"));
      else
        objc_msgSend(v7, "removeObject:", CFSTR("⇧"));
      if ((objc_msgSend(v9, "modifierState") & 0x10) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("⇪"));
      else
        objc_msgSend(v7, "removeObject:", CFSTR("⇪"));
      if ((objc_msgSend(v9, "modifierState") & 0x40) != 0)
        objc_msgSend(v7, "addObject:", CFSTR("Fn"));
      else
        objc_msgSend(v7, "removeObject:", CFSTR("Fn"));
    }

  }
  v10 = (void *)MEMORY[0x1E0CF4900];
  objc_msgSend(v7, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyChordWithKeys:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
