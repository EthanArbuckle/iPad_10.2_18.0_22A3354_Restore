@implementation _GEOURLStateCapture

- (_GEOURLStateCapture)init
{
  _GEOURLStateCapture *v2;
  void *global_queue;
  _GEOURLStateCapture *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_GEOURLStateCapture;
  v2 = -[_GEOURLStateCapture init](&v6, sel_init);
  if (v2)
  {
    global_queue = (void *)geo_get_global_queue();
    GEORegisterPListStateCaptureLegacy();

    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  GEOUnregisterStateCaptureLegacy();
  v3.receiver = self;
  v3.super_class = (Class)_GEOURLStateCapture;
  -[_GEOURLStateCapture dealloc](&v3, sel_dealloc);
}

- (id)captureStatePlistWithHints:(os_state_hints_s *)a3
{
  unint64_t v3;
  const __CFString *v4;
  unint64_t v5;
  const __CFString *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[9];
  _QWORD v38[11];

  v38[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 66);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v4 = CFSTR("<null>");
  v5 = 0x1E0CB3000uLL;
  do
  {
    if (v3 - 23 < 0x2B || v3 <= 0x15 && ((1 << v3) & 0x3DDE27) != 0)
    {
      v33 = 0;
      v6 = CFSTR("Network Defaults");
      switch(v3)
      {
        case 0uLL:
          break;
        case 1uLL:
          v6 = CFSTR("Resource Manifest");
          break;
        case 2uLL:
          v6 = CFSTR("Directions");
          break;
        case 5uLL:
          v6 = CFSTR("ETA");
          break;
        case 9uLL:
          v6 = CFSTR("Search Manifest");
          break;
        case 0xAuLL:
          v6 = CFSTR("RAP Submission");
          break;
        case 0xBuLL:
          v6 = CFSTR("RAP Status");
          break;
        case 0xCuLL:
          v6 = CFSTR("RAP Categories");
          break;
        case 0xEuLL:
          v6 = CFSTR("Country Code");
          break;
        case 0xFuLL:
          v6 = CFSTR("Location Shift (polynomial)");
          break;
        case 0x10uLL:
          v6 = CFSTR("Batch Reverse Geocoder (Legacy)");
          break;
        case 0x12uLL:
          v6 = CFSTR("Simple ETA");
          break;
        case 0x13uLL:
          v6 = CFSTR("Address Correction Init");
          break;
        case 0x14uLL:
          v6 = CFSTR("Address Correction Update");
          break;
        case 0x15uLL:
          v6 = CFSTR("Reverse Geocoder Versions");
          break;
        case 0x17uLL:
          v6 = CFSTR("Announcements");
          break;
        case 0x18uLL:
          v6 = CFSTR("PlaceData Dispatcher");
          break;
        case 0x19uLL:
          v6 = CFSTR("RAP Opt-Ins");
          break;
        case 0x1AuLL:
          v6 = CFSTR("Experiments");
          break;
        case 0x1BuLL:
          v6 = CFSTR("Business Portal Base URL");
          break;
        case 0x1CuLL:
          v6 = CFSTR("LogMessage Usage");
          break;
        case 0x1DuLL:
          v6 = CFSTR("Spatial Lookup");
          break;
        case 0x1EuLL:
          v6 = CFSTR("Realtime Traffic Probe");
          break;
        case 0x1FuLL:
          v6 = CFSTR("Batch Traffic Probe");
          break;
        case 0x20uLL:
          v6 = CFSTR("LogMessage Usage v3");
          break;
        case 0x21uLL:
          v6 = CFSTR("Proactive Routing");
          break;
        case 0x22uLL:
          v6 = CFSTR("Background Dispatcher");
          break;
        case 0x23uLL:
          v6 = CFSTR("Blue POI");
          break;
        case 0x24uLL:
          v6 = CFSTR("Background Reverse Geocoder");
          break;
        case 0x25uLL:
          v6 = CFSTR("Image Service");
          break;
        case 0x26uLL:
          v6 = CFSTR("WiFi Connection Quality Probe");
          break;
        case 0x27uLL:
          v6 = CFSTR("Maps Auth Service Proxy URL");
          break;
        case 0x28uLL:
          v6 = CFSTR("Munin Base");
          break;
        case 0x29uLL:
          v6 = CFSTR("WiFi Quality Service");
          break;
        case 0x2AuLL:
          v6 = CFSTR("RAP V4 Submission");
          break;
        case 0x2BuLL:
          v6 = CFSTR("RAP V4 Lookup");
          break;
        case 0x2CuLL:
          v6 = CFSTR("Usage v3 for cohort session messages");
          break;
        case 0x2DuLL:
          v6 = CFSTR("Usage v3 for long session messages");
          break;
        case 0x2EuLL:
          v6 = CFSTR("Usage v3 for short session messages");
          break;
        case 0x2FuLL:
          v6 = CFSTR("Usage v3 for sessionless messages");
          break;
        case 0x30uLL:
          v6 = CFSTR("Web Module Base");
          break;
        case 0x31uLL:
          v6 = CFSTR("WiFi Tile Service");
          break;
        case 0x32uLL:
          v6 = CFSTR("Community Token Authentication");
          break;
        case 0x33uLL:
          v6 = CFSTR("Maps Authentication for client feature flags URL");
          break;
        case 0x34uLL:
          v6 = CFSTR("Address Correction Tagged Location");
          break;
        case 0x35uLL:
          v6 = CFSTR("Ratings and Photos Submission URL");
          break;
        case 0x36uLL:
          v6 = CFSTR("UGC Log Discard");
          break;
        case 0x37uLL:
          v6 = CFSTR("Batch Reverse Geocoder");
          break;
        case 0x38uLL:
          v6 = CFSTR("Pressure Probe Data");
          break;
        case 0x39uLL:
          v6 = CFSTR("POI Busyness Data");
          break;
        case 0x3AuLL:
          v6 = CFSTR("RAP Web Module");
          break;
        case 0x3BuLL:
          v6 = CFSTR("Network Selection Harvest Data");
          break;
        case 0x3CuLL:
          v6 = CFSTR("Offline Data Batch List");
          break;
        case 0x3DuLL:
          v6 = CFSTR("Offline Data Size");
          break;
        case 0x3EuLL:
          v6 = CFSTR("Offline Data Download");
          break;
        case 0x3FuLL:
          v6 = CFSTR("BCX Dispatcher");
          break;
        case 0x40uLL:
          v6 = CFSTR("Connectivity Check");
          break;
        case 0x41uLL:
          v6 = CFSTR("CoreLocation KAC");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid (%d)"), v3);
          v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      _recordForType(v3, (uint64_t)&v34);
      v7 = DWORD2(v34);
      v8 = v35;
      _GEOGetURLWithSource(v3, &v33, 1, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      _getValue(v7, v8, 1, 0, 0, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      v35 = 0u;
      v36 = 0u;
      v34 = 0u;
      _recordForType(v3, (uint64_t)&v34);
      GEODefaultsKeyStringForConfigKey(SDWORD2(v34), v35);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v32 = v3;
      _GEOURLInfoFromActiveTileGroup(v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v37[0] = CFSTR("description");
      v37[1] = CFSTR("resolved_url");
      v31 = (void *)v9;
      if (v9)
        v14 = v9;
      else
        v14 = (uint64_t)v4;
      v15 = (__CFString *)v6;
      v38[0] = v6;
      v38[1] = v14;
      v37[2] = CFSTR("manifest_url");
      objc_msgSend(v12, "url");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v16)
        v18 = v16;
      else
        v18 = (uint64_t)v4;
      v30 = (void *)v10;
      if (v10)
        v19 = v10;
      else
        v19 = (uint64_t)v4;
      v38[2] = v18;
      v38[3] = v19;
      v37[3] = CFSTR("config_url");
      v37[4] = CFSTR("source");
      objc_msgSend(*(id *)(v5 + 2024), "numberWithInteger:", v33);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v38[4] = v20;
      v37[5] = CFSTR("source_description");
      v21 = CFSTR("Invalid");
      if (v33 <= 7)
        v21 = off_1E1C132A0[v33];
      if (v11)
        v22 = v11;
      else
        v22 = v4;
      v38[5] = v21;
      v38[6] = v22;
      v37[6] = CFSTR("config_key");
      v37[7] = CFSTR("proxied");
      objc_msgSend(*(id *)(v5 + 2024), "numberWithBool:", objc_msgSend(v13, "useAuthProxy"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38[7] = v23;
      v37[8] = CFSTR("mptcp");
      v24 = v4;
      objc_msgSend(*(id *)(v5 + 2024), "numberWithBool:", objc_msgSend(v13, "supportsMultipathTCP"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v38[8] = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 9);
      v26 = v5;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v27, v15);

      v5 = v26;
      v4 = v24;

      v3 = v32;
    }
    ++v3;
  }
  while (v3 != 66);
  return v29;
}

@end
