@implementation IMFallbackTranscoder_AudioMessage

- (void)transcodeOpusFile:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t PathComponent;
  const char *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t Property;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  UInt32 ioNumberFrames;
  AudioBufferList ioData;
  uint64_t v84;
  AudioConverterRef outPropertyData;
  int v86;
  UInt32 ioPropertyDataSize;
  __int128 inPropertyData;
  __int128 v89;
  uint64_t v90;
  AudioStreamBasicDescription inStreamDesc;
  ExtAudioFileRef v92;
  uint64_t v93;
  ExtAudioFileRef outExtAudioFile;
  void *v95;
  uint8_t buf[4];
  void *v97;
  __int16 v98;
  uint64_t v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    outExtAudioFile = 0;
    v7 = ExtAudioFileOpenURL((CFURLRef)a3, &outExtAudioFile);
    v14 = v7;
    if (outExtAudioFile)
      v15 = (_DWORD)v7 == 0;
    else
      v15 = 0;
    if (v15)
    {
      v21 = (void *)objc_msgSend__tmpOutputFileURL(self, v8, v9, v10, v11, v12, v13);
      v93 = 0;
      v28 = (void *)objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v22, v23, v24, v25, v26, v27);
      PathComponent = objc_msgSend_URLByDeletingLastPathComponent(v21, v29, v30, v31, v32, v33, v34);
      objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v28, v36, PathComponent, 1, 0, (uint64_t)&v93, v37);
      if (v93)
      {
        if (IMOSLoggingEnabled())
        {
          v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v97 = v21;
            v98 = 2112;
            v99 = v93;
            _os_log_impl(&dword_21DFB1000, v38, OS_LOG_TYPE_INFO, "IMFallbackTranscoder_AudioMessage: error creating directory for path %@ with error %@", buf, 0x16u);
          }
        }
        (*((void (**)(id, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t))a4 + 2))(a4, 0, 0, v93, 0, 1);
      }
      else
      {
        v92 = 0;
        memset(&inStreamDesc.mFormatID, 0, 32);
        inStreamDesc.mSampleRate = 8000.0;
        inStreamDesc.mFormatID = 1935764850;
        inStreamDesc.mChannelsPerFrame = 1;
        v39 = ExtAudioFileCreateWithURL((CFURLRef)v21, 0x616D7266u, &inStreamDesc, 0, 1u, &v92);
        if (!v92 || (_DWORD)v39)
        {
          ExtAudioFileDispose(outExtAudioFile);
          if (v92)
            ExtAudioFileDispose(v92);
          v49 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v44, (uint64_t)CFSTR("Creating new file at path: %@"), v45, v46, v47, v48, v21);
          objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v50, v39, v49, (uint64_t)a4, v51, v52);
        }
        else
        {
          inPropertyData = xmmword_21DFD0BE8;
          v89 = unk_21DFD0BF8;
          v90 = 32;
          v40 = ExtAudioFileSetProperty(v92, 0x63666D74u, 0x28u, &inPropertyData);
          if ((_DWORD)v40)
          {
            ExtAudioFileDispose(outExtAudioFile);
            ExtAudioFileDispose(v92);
            objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v41, v40, (uint64_t)CFSTR("ExtAudioFileSetProperty / kExtAudioFileProperty_ClientDataFormat for AMR"), (uint64_t)a4, v42, v43);
          }
          else
          {
            v53 = ExtAudioFileSetProperty(outExtAudioFile, 0x63666D74u, 0x28u, &inPropertyData);
            if ((_DWORD)v53)
            {
              ExtAudioFileDispose(outExtAudioFile);
              ExtAudioFileDispose(v92);
              objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v54, v53, (uint64_t)CFSTR("ExtAudioFileSetProperty / kExtAudioFileProperty_ClientDataFormat for Opus"), (uint64_t)a4, v55, v56);
            }
            else
            {
              outPropertyData = 0;
              v86 = 6700;
              ioPropertyDataSize = 8;
              Property = ExtAudioFileGetProperty(v92, 0x61636E76u, &ioPropertyDataSize, &outPropertyData);
              if ((_DWORD)Property)
              {
                ExtAudioFileDispose(outExtAudioFile);
                ExtAudioFileDispose(v92);
                objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v58, Property, (uint64_t)CFSTR("ExtAudioFileGetProperty / kExtAudioFileProperty_AudioConverter for AMR"), (uint64_t)a4, v59, v60);
              }
              else
              {
                v61 = AudioConverterSetProperty(outPropertyData, 0x62726174u, 4u, &v86);
                if ((_DWORD)v61)
                {
                  ExtAudioFileDispose(outExtAudioFile);
                  ExtAudioFileDispose(v92);
                  objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v62, v61, (uint64_t)CFSTR("AudioConverterSetProperty / kAudioConverterEncodeBitRate for outConverter"), (uint64_t)a4, v63, v64);
                }
                else
                {
                  v84 = 0;
                  v65 = ExtAudioFileSetProperty(v92, 0x61636366u, 8u, &v84);
                  if ((_DWORD)v65)
                  {
                    ExtAudioFileDispose(outExtAudioFile);
                    ExtAudioFileDispose(v92);
                    objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v66, v65, (uint64_t)CFSTR("ExtAudioFileSetProperty / kExtAudioFileProperty_ConverterConfig for AMR"), (uint64_t)a4, v67, v68);
                  }
                  else
                  {
                    bzero(buf, 0x8000uLL);
                    while (1)
                    {
                      *(&ioData.mNumberBuffers + 1) = 0;
                      *(_QWORD *)&ioData.mBuffers[0].mNumberChannels = 0x800000000001;
                      ioData.mBuffers[0].mData = buf;
                      ioNumberFrames = 0x8000u / DWORD2(v89);
                      ioData.mNumberBuffers = 1;
                      v69 = ExtAudioFileRead(outExtAudioFile, &ioNumberFrames, &ioData);
                      if ((_DWORD)v69)
                      {
                        ExtAudioFileDispose(outExtAudioFile);
                        ExtAudioFileDispose(v92);
                        objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v74, v69, (uint64_t)CFSTR("ExtAudioFileRead"), (uint64_t)a4, v75, v76);
                        return;
                      }
                      if (!ioNumberFrames)
                        break;
                      v70 = ExtAudioFileWrite(v92, ioNumberFrames, &ioData);
                      if ((_DWORD)v70)
                      {
                        ExtAudioFileDispose(outExtAudioFile);
                        ExtAudioFileDispose(v92);
                        objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v71, v70, (uint64_t)CFSTR("ExtAudioFileWrite"), (uint64_t)a4, v72, v73);
                        return;
                      }
                    }
                    ExtAudioFileDispose(outExtAudioFile);
                    ExtAudioFileDispose(v92);
                    v95 = v21;
                    v81 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v77, (uint64_t)&v95, 1, v78, v79, v80);
                    (*((void (**)(id, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))a4 + 2))(a4, v81, 0, 0, 1, 1);
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v16 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v8, (uint64_t)CFSTR("Opening Opus file at path %@"), v10, v11, v12, v13, a3);
      objc_msgSend__failWithOSStatusErrorCode_description_completion_(self, v17, v14, v16, (uint64_t)a4, v18, v19);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DFB1000, v20, OS_LOG_TYPE_INFO, "IMFallbackTranscoder_AudioMessage: nil filePath", buf, 2u);
      }
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t))a4 + 2))(a4, 0, 0, 0, 0, 1);
  }
}

- (id)_tmpOutputFileURL
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)IMSafeTemporaryDirectory();
  v9 = objc_msgSend_path(v2, v3, v4, v5, v6, v7, v8);
  v32[1] = objc_msgSend_stringGUID(MEMORY[0x24BDD17C8], v10, v11, v12, v13, v14, v15, v9);
  v32[2] = CFSTR("Audio Message.amr");
  v20 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v16, (uint64_t)v32, 3, v17, v18, v19);
  v26 = objc_msgSend_pathWithComponents_(MEMORY[0x24BDD17C8], v21, v20, v22, v23, v24, v25);
  return (id)objc_msgSend_fileURLWithPath_isDirectory_(MEMORY[0x24BDBCF48], v27, v26, 0, v28, v29, v30);
}

- (void)_failWithOSStatusErrorCode:(int)a3 description:(id)a4 completion:(id)a5
{
  const __CFString *v6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v6 = (const __CFString *)a4;
  v17 = *MEMORY[0x24BDAC8D0];
  if (!a4)
  {
    IMLogBacktrace();
    v6 = CFSTR("NO DESCRIPTION!");
  }
  if (IMOSLoggingEnabled())
  {
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13 = 138412546;
      v14 = v6;
      v15 = 1024;
      v16 = a3;
      _os_log_impl(&dword_21DFB1000, v11, OS_LOG_TYPE_INFO, "IMFallbackTranscoder_AudioMessage: %@ failed with error code %d", (uint8_t *)&v13, 0x12u);
    }
  }
  if (a5)
  {
    v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x24BDD1540], v8, *MEMORY[0x24BDD1100], a3, 0, v9, v10);
    (*((void (**)(id, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t))a5 + 2))(a5, 0, 0, v12, 0, 1);
  }
}

@end
