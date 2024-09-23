@implementation NSError(Announce_Private)

+ (id)an_errorWithCode:()Announce_Private component:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = a4;
  objc_msgSend(v5, "_descriptionForErrorCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "an_errorWithCode:component:description:", a3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)an_errorWithCode:()Announce_Private component:description:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = v7;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%@] %@"), a4, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;
  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BDD0BA0];
  v16[0] = *MEMORY[0x24BDD0FC8];
  v16[1] = v12;
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.announce"), a3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (const)_descriptionForErrorCode:()Announce_Private
{
  const __CFString *result;

  result = CFSTR("Home Object Not Found");
  switch(a3)
  {
    case 1001:
      return result;
    case 1002:
      result = CFSTR("Home Not Found");
      break;
    case 1003:
      result = CFSTR("Zone Not Found");
      break;
    case 1004:
      result = CFSTR("Room Not Found");
      break;
    case 1005:
    case 1010:
    case 1011:
    case 1014:
    case 1036:
    case 1039:
    case 1040:
    case 1048:
LABEL_5:
      result = CFSTR("Unknown Error");
      break;
    case 1006:
      result = CFSTR("Current home is not available.");
      break;
    case 1007:
      result = CFSTR("No Homes Found");
      break;
    case 1008:
      result = CFSTR("Announcement Not Found");
      break;
    case 1009:
      result = CFSTR("Did not find any viable listeners in home.");
      break;
    case 1012:
      result = CFSTR("Rapport and IDS Send Message Errors");
      break;
    case 1013:
      result = CFSTR("Multiple Send Errors");
      break;
    case 1015:
      result = CFSTR("No available HomePods to relay announcement.");
      break;
    case 1016:
      result = CFSTR("Invalid Home");
      break;
    case 1017:
      result = CFSTR("Announce Access Not Enabled");
      break;
    case 1018:
      result = CFSTR("Failed to start Playback");
      break;
    case 1019:
      result = CFSTR("Playback Finished Unsuccessfully");
      break;
    case 1020:
      result = CFSTR("Not currently playing announcements");
      break;
    case 1021:
      result = CFSTR("Cannot skip beyond last announcement");
      break;
    case 1022:
      result = CFSTR("No announcements found to play back");
      break;
    case 1023:
      result = CFSTR("Missing File Path");
      break;
    case 1024:
      result = CFSTR("Audio Session Media Services were Lost");
      break;
    case 1025:
      result = CFSTR("Audio Session Media Services were Reset");
      break;
    case 1026:
      result = CFSTR("Failed to serialize message to Data.");
      break;
    case 1027:
      result = CFSTR("Playback Finished Due to Audio Session Interruption");
      break;
    case 1028:
      result = CFSTR("Did not find any homes that support announce.");
      break;
    case 1029:
      result = CFSTR("Current home does not support announce.");
      break;
    case 1030:
      result = CFSTR("Validation Failure");
      break;
    case 1031:
      result = CFSTR("No Recipients with Announce Enabled Found");
      break;
    case 1032:
      result = CFSTR("No nearby HomePods available for Relay.");
      break;
    case 1033:
      result = CFSTR("Home does not contain any HomePods");
      break;
    case 1034:
      result = CFSTR("Target location does not contain any HomePods");
      break;
    case 1035:
      result = CFSTR("Home does not contain any HomePods that support Announce");
      break;
    case 1037:
      result = CFSTR("Playback stopped. Not an actual failure.");
      break;
    case 1038:
      result = CFSTR("Failed to resume playback.");
      break;
    case 1041:
      result = CFSTR("Failed to Create Output File");
      break;
    case 1042:
      result = CFSTR("Unsupported Data Type");
      break;
    case 1043:
      result = CFSTR("Did not find any other viable HomePod listeners in home.");
      break;
    case 1044:
      result = CFSTR("Empty Audio File");
      break;
    case 1045:
      result = CFSTR("Unsupported Announcement Destination Type");
      break;
    case 1046:
      result = CFSTR("Unsupported Announcement Action Type");
      break;
    case 1047:
      result = CFSTR("Recognized User and no other recipients with Announce enabled");
      break;
    case 1049:
      result = CFSTR("Destination does not contain announce-capable devices");
      break;
    case 1050:
      result = CFSTR("Unsupported Playback Command");
      break;
    case 1051:
      result = CFSTR("Failed to find Endpoint Accessory in Home");
      break;
    case 1052:
      result = CFSTR("File not found");
      break;
    case 1053:
      result = CFSTR("Failed to load player item");
      break;
    case 1054:
      result = CFSTR("Failed to Preroll AVPlayer");
      break;
    case 1055:
      result = CFSTR("Player Status Failed");
      break;
    case 1056:
      result = CFSTR("Home App is not installed");
      break;
    default:
      switch(a3)
      {
        case 5000:
          result = CFSTR("Failed to send an announcement through one or more connections");
          break;
        case 5001:
          result = CFSTR("Failed to start remote playback session");
          break;
        case 5002:
          result = CFSTR("Failed to create a track player");
          break;
        case 5003:
          result = CFSTR("Announcement requested to play in the past");
          break;
        case 5004:
          result = CFSTR("Audio Player finished playing with an error");
          break;
        case 5005:
          result = CFSTR("No home identifier in announcement");
          break;
        case 5006:
          result = CFSTR("Failed to find home for an identifier");
          break;
        case 5007:
          result = CFSTR("No group identifier in announcement");
          break;
        case 5008:
          result = CFSTR("Failed to clean the received cache directory");
          break;
        case 5009:
          result = CFSTR("Failed to write announcement data to file");
          break;
        case 5010:
          result = CFSTR("Failed to remove file from disk");
          break;
        case 5011:
          result = CFSTR("Failed to get cache directory for announcements sent and received");
          break;
        case 5012:
          result = CFSTR("Failed to add notification request to Notification Center");
          break;
        case 5013:
          result = CFSTR("Failed to replace Notification content in Notification Center");
          break;
        case 5014:
          result = CFSTR("State Publisher failed to set state");
          break;
        case 5015:
          result = CFSTR("State Publisher failed to get registration token");
          break;
        case 5016:
          result = CFSTR("Failed to load announcement data from file url");
          break;
        case 5017:
          result = CFSTR("Failed to initialize announcement from a message dictionary");
          break;
        case 5018:
          result = CFSTR("Received announcement from an unsupported connection");
          break;
        case 5019:
          result = CFSTR("Failed to process audio data");
          break;
        case 5020:
          result = CFSTR("Failed property list serialization on IDS data");
          break;
        case 5021:
          result = CFSTR("Failed to extract data from an IDS url");
          break;
        case 5022:
          result = CFSTR("Failed to send an IDS message");
          break;
        case 5023:
          result = CFSTR("Broadcast announcement played event failed");
          break;
        case 5024:
          result = CFSTR("Coordination service error activating link");
          break;
        case 5025:
          result = CFSTR("Unsupported sender type");
          break;
        case 5026:
          result = CFSTR("Failed to write data to url");
          break;
        case 5027:
          result = CFSTR("Failed to rename directory before safely purging");
          break;
        case 5028:
          result = CFSTR("Failed to remove temporary sub directory");
          break;
        case 5029:
          result = CFSTR("Failed to remote item");
          break;
        case 5030:
          result = CFSTR("Failed to create directory");
          break;
        case 5031:
          result = CFSTR("Failed to remove directory");
          break;
        case 5032:
          result = CFSTR("Played empty audio file");
          break;
        case 5033:
          result = CFSTR("Announcement in home collection timeout");
          break;
        case 5034:
          result = CFSTR("No file path found for announcement");
          break;
        default:
          goto LABEL_5;
      }
      break;
  }
  return result;
}

@end
