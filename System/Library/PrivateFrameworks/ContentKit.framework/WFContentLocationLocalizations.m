@implementation WFContentLocationLocalizations

+ (id)localizedTitleForContentLocationWithIdentifier:(id)a3
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  __CFString *v8;
  __CFString *v9;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.airdropDestination")))
  {
    v4 = CFSTR("AirDrop");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.appleScriptDestination")))
  {
    v4 = CFSTR("AppleScript");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.cellularDataStatisticsDestination")))
  {
    v4 = CFSTR("Cellular Data Statistics");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.clipboardDestination")))
  {
    v4 = CFSTR("Clipboard");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.controlOtherApps")))
  {
    v4 = CFSTR("Control Other Apps");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.dataRoamingDestination")))
  {
    v4 = CFSTR("Data Roaming");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.defaultLineDestination")))
  {
    v4 = CFSTR("Default Cellular Line");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.focusDestination")))
  {
    v4 = CFSTR("Focus");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.javaScript")))
  {
    v4 = CFSTR("JavaScript");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.javaScriptForAutomationDestination")))
  {
    v4 = CFSTR("JavaScript for Automation");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.microphoneDestination")))
  {
    v4 = CFSTR("Microphone");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.networkDestination")))
  {
    v4 = CFSTR("Network Information");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.notificationDestination")))
  {
    v4 = CFSTR("Notification");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.onScreenContentDestination")))
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.locationDestination")))
      {
        v8 = CFSTR("UserLocation");
        v9 = CFSTR("Location");
      }
      else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.personalHotspotPasswordDestination")))
      {
        v8 = CFSTR("PersonalHotspotPasswordLocation");
        v9 = CFSTR("Personal Hotspot Password");
      }
      else
      {
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.printDestination")))
        {
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.shareExtensionDestination")))
          {
            v4 = CFSTR("Share extension");
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.shellDestination")))
          {
            v4 = CFSTR("Shell");
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.screenshotDestination")))
          {
            v4 = CFSTR("Screenshot");
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.speechRecognitionDestination")))
          {
            v4 = CFSTR("Speech Recognition");
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.toggleCellularLineDestination")))
          {
            v4 = CFSTR("Toggle Cellular Plan");
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.wallpaperDestination")))
          {
            v4 = CFSTR("Wallpaper");
          }
          else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.webpagesDestination")))
          {
            v4 = CFSTR("Web Content");
          }
          else
          {
            if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.windowsDestination")))
            {
              v6 = 0;
              goto LABEL_31;
            }
            v4 = CFSTR("Windows");
          }
          goto LABEL_29;
        }
        v8 = CFSTR("PrinterPermission");
        v9 = CFSTR("Printer");
      }
      WFLocalizedStringWithKey(v8, v9);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    v4 = CFSTR("On Screen Content");
  }
LABEL_29:
  WFLocalizedString(v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_30:
  v6 = (void *)v5;
LABEL_31:

  return v6;
}

+ (id)sfSymbolNameForContentLocationWithIdentifier:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.airdropDestination")) & 1) != 0)
  {
    v4 = CFSTR("airdrop");
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.appleScriptDestination")) & 1) != 0)
      goto LABEL_4;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.clipboardDestination")) & 1) != 0)
    {
      v4 = CFSTR("scissors");
      goto LABEL_14;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.controlOtherApps")) & 1) != 0)
    {
      v4 = CFSTR("menubar.dock.rectangle.badge.record");
      goto LABEL_14;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.dataRoamingDestination")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.defaultLineDestination")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.toggleCellularLineDestination")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.cellularDataStatisticsDestination")) & 1) != 0)
    {
      v4 = CFSTR("antenna.radiowaves.left.and.right");
      goto LABEL_14;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.focusDestination")) & 1) != 0)
    {
      v4 = CFSTR("moon.fill");
      goto LABEL_14;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.javaScriptForAutomationDestination")) & 1) != 0)
    {
LABEL_4:
      v4 = CFSTR("applescript.fill");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.microphoneDestination")) & 1) != 0)
    {
      v4 = CFSTR("mic.fill");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.networkDestination")) & 1) != 0)
    {
      v4 = CFSTR("network");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.notificationDestination")) & 1) != 0)
    {
      v4 = CFSTR("app.badge");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.onScreenContentDestination")) & 1) != 0)
    {
      v4 = CFSTR("display");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.locationDestination")) & 1) != 0)
    {
      v4 = CFSTR("location.fill");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.personalHotspotPasswordDestination")) & 1) != 0)
    {
      v4 = CFSTR("personalhotspot");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.printDestination")) & 1) != 0)
    {
      v4 = CFSTR("printer.fill");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.shareExtensionDestination")) & 1) != 0)
    {
      v4 = CFSTR("square.and.arrow.up");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.shellDestination")) & 1) != 0)
    {
      v4 = CFSTR("terminal.fill");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.screenshotDestination")) & 1) != 0)
    {
      v4 = CFSTR("camera.viewfinder");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.speechRecognitionDestination")) & 1) != 0)
    {
      v4 = CFSTR("waveform");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.wallpaperDestination")) & 1) != 0)
    {
      v4 = CFSTR("photos");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.webpagesDestination")) & 1) != 0)
    {
      v4 = CFSTR("safari.fill");
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.windowsDestination")))
    {
      v4 = CFSTR("gear");
    }
    else
    {
      v4 = 0;
    }
  }
LABEL_14:

  return (id)v4;
}

+ (id)symbolBackgroundColorForContentLocationWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.airdropDestination")))
    goto LABEL_2;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.appleScriptDestination")))
  {
LABEL_8:
    v4 = (void *)MEMORY[0x24BEC1398];
    v5 = 14;
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.clipboardDestination")))
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.controlOtherApps")))
      goto LABEL_8;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.dataRoamingDestination")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.defaultLineDestination")) & 1) != 0
      || (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.toggleCellularLineDestination")) & 1) != 0
      || objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.cellularDataStatisticsDestination")))
    {
LABEL_16:
      v4 = (void *)MEMORY[0x24BEC1398];
      v5 = 3;
      goto LABEL_9;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.focusDestination")))
    {
      v4 = (void *)MEMORY[0x24BEC1398];
      v5 = 10;
      goto LABEL_9;
    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.javaScriptForAutomationDestination")))goto LABEL_8;
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.microphoneDestination")))
    {
LABEL_21:
      v6 = (void *)MEMORY[0x24BEC1398];
      v7 = 0.301960796;
      v8 = 0.243137255;
      goto LABEL_6;
    }
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.networkDestination")))
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.notificationDestination")))
      {
        v4 = (void *)MEMORY[0x24BEC1398];
        v5 = 2;
        goto LABEL_9;
      }
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.onScreenContentDestination")))
        goto LABEL_8;
      if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.locationDestination")))
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.personalHotspotPasswordDestination")))goto LABEL_16;
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.printDestination")))
          goto LABEL_8;
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.shareExtensionDestination")))
          goto LABEL_30;
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.shellDestination")))
          goto LABEL_8;
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.screenshotDestination")))
        {
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.speechRecognitionDestination")))goto LABEL_21;
          if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.wallpaperDestination")))
          {
LABEL_30:
            v4 = (void *)MEMORY[0x24BEC1398];
            v5 = 9;
            goto LABEL_9;
          }
          if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.webpagesDestination")))
          {
            if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.windowsDestination")))
            {
              v10 = 0;
              goto LABEL_11;
            }
            goto LABEL_8;
          }
        }
      }
    }
LABEL_2:
    v4 = (void *)MEMORY[0x24BEC1398];
    v5 = 4;
LABEL_9:
    objc_msgSend(v4, "colorWithSystemColor:", v5);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x24BEC1398];
  v7 = 0.325490206;
  v8 = 0.345098048;
LABEL_6:
  objc_msgSend(v6, "colorWithRed:green:blue:alpha:", 0.925490201, v7, v8, 1.0);
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v10 = (void *)v9;
LABEL_11:

  return v10;
}

+ (id)localizedTitleForContentLocationWithHostname:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("evernote.com")) & 1) != 0)
  {
    v4 = CFSTR("Evernote");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("api.giphy.com")) & 1) != 0)
  {
    v4 = CFSTR("GIPHY");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("api.imgur.com")) & 1) != 0)
  {
    v4 = CFSTR("Imgur");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("instapaper.com")) & 1) != 0)
  {
    v4 = CFSTR("Instapaper");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("api.pinboard.in")) & 1) != 0)
  {
    v4 = CFSTR("Pinboard");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("getpocket.com")) & 1) != 0)
  {
    v4 = CFSTR("Pocket");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("todoist.com")) & 1) != 0)
  {
    v4 = CFSTR("Todoist");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("api.trello.com")) & 1) != 0)
  {
    v4 = CFSTR("Trello");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tumblr.com")) & 1) != 0)
  {
    v4 = CFSTR("Tumblr");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("wordpress.com")))
    {
      v5 = 0;
      goto LABEL_22;
    }
    v4 = CFSTR("WordPress.com");
  }
  WFLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v5;
}

@end
