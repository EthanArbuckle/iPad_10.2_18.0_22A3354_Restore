@implementation VCSessionErrorUtils

+ (id)VCSessionErrorEvent:(unsigned int)a3 errorPath:(id)a4 returnCode:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id result;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;

  switch(a3)
  {
    case 1u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Add participant failed");
      v10 = CFSTR("Remote participant already exist in session");
      v12 = 32016;
      v13 = 1;
      goto LABEL_27;
    case 2u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Add participant failed");
      v10 = CFSTR("Remote participant data is nil");
      v12 = 32016;
      v13 = 2;
      goto LABEL_27;
    case 3u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Trying to remove an unknown participant");
      v10 = CFSTR("Invalid participant");
      v12 = 32016;
      v13 = 3;
      goto LABEL_27;
    case 4u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Bad API usage");
      v10 = CFSTR("Start called on a stopping session");
      v12 = 32028;
      v13 = 4;
      goto LABEL_27;
    case 5u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Bad API usage");
      v10 = CFSTR("Stop called on a starting session");
      v12 = 32028;
      v13 = 5;
      goto LABEL_27;
    case 6u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Bad API usage");
      v10 = CFSTR("Start called while session is already in progress");
      v12 = 32028;
      v13 = 6;
      goto LABEL_27;
    case 7u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Bad API usage");
      v10 = CFSTR("Stop called on an already stopped session");
      v12 = 32028;
      v13 = 7;
      goto LABEL_27;
    case 8u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Session start failed");
      v10 = CFSTR("One or more participants failed to start");
      v12 = 32000;
      v13 = 8;
      goto LABEL_27;
    case 9u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Add participant failed");
      v10 = CFSTR("Remote source collision detected");
      v12 = 32024;
      v13 = 9;
      goto LABEL_27;
    case 0xAu:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Add participant failed");
      v10 = CFSTR("Local source collision detected");
      v12 = 32024;
      v13 = 10;
      goto LABEL_27;
    case 0xBu:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Update configuration failed");
      v10 = CFSTR("Failed to update session configuration");
      v12 = 32016;
      v13 = 11;
      goto LABEL_27;
    case 0xCu:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Media decryption failed");
      v10 = CFSTR("Remote media decryption failed");
      v12 = 32018;
      v13 = 12;
      goto LABEL_27;
    case 0xDu:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Fractured media detected");
      v10 = CFSTR("Remote participant subscribed to unknown stream ID");
      v12 = 32027;
      v13 = 13;
      goto LABEL_27;
    case 0xEu:
    case 0x18u:
    case 0x19u:
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = a3;
      v9 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No remote packets for %ld seconds"), a5);
      v10 = CFSTR("Remote network outage?");
      v11 = v7;
      v12 = 32001;
      v13 = v8;
      goto LABEL_27;
    case 0xFu:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Init remote participant failed");
      v17 = CFSTR("Unable to init remote participant");
      v18 = 32016;
      v19 = 15;
      goto LABEL_25;
    case 0x10u:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Add OneToOne Participant failed");
      v17 = CFSTR("Unable to add OneToOne participant");
      v18 = 32016;
      v19 = 16;
      goto LABEL_25;
    case 0x11u:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Configure remote participant failed");
      v17 = CFSTR("Unable to configure remote participant");
      v18 = 32016;
      v19 = 17;
      goto LABEL_25;
    case 0x12u:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Configure OneToOne Local participant failed");
      v17 = CFSTR("Unable to configure OneToOne Local participant");
      v18 = 32016;
      v19 = 18;
      goto LABEL_25;
    case 0x13u:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Session failed to switch from OneToOne to Multiway");
      v17 = CFSTR("Unable to send control message");
      v18 = 32000;
      v19 = 19;
      goto LABEL_25;
    case 0x14u:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Session failed to switch from Multiway to OneToOne");
      v17 = CFSTR("Unable to send control message");
      v18 = 32000;
      v19 = 20;
      goto LABEL_25;
    case 0x15u:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Uplink key material failed to roll");
      v17 = CFSTR("No uplink key material update event");
      v18 = 32018;
      v19 = 21;
      goto LABEL_25;
    case 0x16u:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = CFSTR("Call terminated gracefully");
      v17 = CFSTR("Remote participant hung up");
      v18 = 32003;
      v19 = 22;
LABEL_25:
      result = (id)objc_msgSend(v15, "AVConferenceServiceError:detailedCode:filePath:description:reason:", v18, v19, a4, v16, v17);
      break;
    case 0x17u:
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("Call failed");
      v10 = CFSTR("Media server terminated");
      v12 = 32000;
      v13 = 23;
LABEL_27:
      result = (id)objc_msgSend(v11, "AVConferenceServiceError:detailedCode:returnCode:filePath:description:reason:", v12, v13, a5, a4, v9, v10);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)VCSessionParticipantErrorEvent:(unsigned int)a3 errorPath:(id)a4
{
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  id result;

  switch(a3)
  {
    case 1u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Failed to set audio position");
      v7 = CFSTR("Audio position value is out of range");
      v8 = 32016;
      v9 = 1;
      goto LABEL_3;
    case 2u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant start error");
      v7 = CFSTR("Start called on stopping participant");
      v8 = 32028;
      v9 = 2;
      goto LABEL_3;
    case 3u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant stop error");
      v7 = CFSTR("Stop called on a starting participant");
      v8 = 32028;
      v9 = 3;
      goto LABEL_3;
    case 4u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant start error");
      v7 = CFSTR("Start called on an already started participant");
      v8 = 32028;
      v9 = 4;
      goto LABEL_3;
    case 5u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant stop error");
      v7 = CFSTR("Stop called on an already stopped participant");
      v8 = 32028;
      v9 = 5;
      goto LABEL_3;
    case 6u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant enabling/disabling audio/video in progress");
      v7 = CFSTR("Enable/disable audio or video called when it is already in progress");
      v8 = 32028;
      v9 = 6;
      goto LABEL_3;
    case 7u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant start in progress");
      v7 = CFSTR("Enable/disable audio or video called on a starting participant");
      v8 = 32028;
      v9 = 7;
      goto LABEL_3;
    case 8u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant stop in progress");
      v7 = CFSTR("Enable/disable audio or video called on a stopping participant");
      v8 = 32028;
      v9 = 8;
      goto LABEL_3;
    case 9u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant in invalid");
      v7 = CFSTR("API called when not in the right state");
      v8 = 32026;
      v9 = 9;
      goto LABEL_3;
    case 0xAu:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant start error");
      v7 = CFSTR("Memory allocation failed");
      v8 = 32000;
      v9 = 10;
      goto LABEL_3;
    case 0xBu:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Failed to set the volume");
      v7 = CFSTR("Invalid input");
      v8 = 32016;
      v9 = 11;
      goto LABEL_3;
    case 0xCu:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant media state change error");
      v7 = CFSTR("Setting the state of this media type is unsupported");
      v8 = 32028;
      v9 = 12;
      goto LABEL_3;
    case 0xDu:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant media state inconsistency");
      v7 = CFSTR("Cannot set different states on stream groups that belong to the same media type");
      v8 = 32028;
      v9 = 13;
      goto LABEL_3;
    case 0xEu:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant captions audio IO failure");
      v7 = CFSTR("Failed to configure audio IO. Will not start captions.");
      v8 = 32000;
      v9 = 14;
      goto LABEL_3;
    case 0xFu:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Participant argument error");
      v7 = CFSTR("The argument is invalid.");
      v8 = 32016;
      v9 = 15;
      goto LABEL_3;
    case 0x10u:
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Media representation error");
      v7 = CFSTR("The provided representation is unsupported.");
      v8 = 16;
      v9 = 16;
LABEL_3:
      result = (id)objc_msgSend(v5, "AVConferenceServiceError:detailedCode:filePath:description:reason:", v8, v9, a4, v6, v7);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

+ (id)VCSessionCaptionsErrorEvent:(unsigned int)a3 errorPath:(id)a4 returnCode:(int64_t)a5
{
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  id result;

  switch(a3)
  {
    case 1u:
    case 4u:
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v7 = a3;
      v8 = CFSTR("Speech Recognizer Error");
      v9 = CFSTR("The Speech Framework is unavailable");
      goto LABEL_3;
    case 2u:
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Captions State Transition Failed");
      v9 = CFSTR("Captions not supported");
      v7 = 2;
      goto LABEL_3;
    case 3u:
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Invalid captions state transition");
      v9 = CFSTR("Unsupported transition");
      v7 = 3;
      goto LABEL_3;
    case 5u:
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Speech Recognizer Error");
      v9 = CFSTR("Recognizer is unavailable");
      v7 = 5;
      goto LABEL_3;
    case 6u:
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Speech Analyzer Error");
      v9 = CFSTR("Analyzer is unavailable");
      v7 = 6;
      goto LABEL_3;
    case 7u:
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v8 = CFSTR("Captions Initalization Error");
      v9 = CFSTR("Recognizer Request/Task or Converter Failed");
      v7 = 7;
LABEL_3:
      result = (id)objc_msgSend(v6, "AVConferenceServiceError:detailedCode:returnCode:filePath:description:reason:", 32016, v7, a5, a4, v8, v9);
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

@end
