@implementation XRConstantEngineeringValueElementParser

+ (id)_elementNameToClassMap
{
  if (qword_25583C6F8 != -1)
    dispatch_once(&qword_25583C6F8, &unk_24EDC3ED0);
  return (id)qword_25583C6F0;
}

- (void)setValue:(id)a3 forElementName:(id)a4
{
  id v7;
  NSMutableArray *v8;
  NSMutableArray *fields;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  if (!self->_fields)
  {
    v8 = (NSMutableArray *)objc_opt_new();
    fields = self->_fields;
    self->_fields = v8;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v10, v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("XREngineeringValue.m"), 291, CFSTR("The allowed subelements are constant engineering values."));

  }
  objc_msgSend_addObject_(self->_fields, v10, (uint64_t)v16, v12, v13);

}

- (void)_handleCompletion
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *fields;
  XRConstantEngineeringValue *v11;
  XRConstantEngineeringValue *parsedValue;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  XRConstantEngineeringValue *v28;
  XRConstantEngineeringValue *v29;
  const char *v30;
  uint64_t v31;
  XRConstantEngineeringValue *v32;
  XRConstantEngineeringValue *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t i;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  XRConstantEngineeringValue *v59;
  XRConstantEngineeringValue *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  XRConstantEngineeringValue *v73;
  XRConstantEngineeringValue *v74;
  uint64_t v75;

  objc_msgSend_elementName(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  fields = self->_fields;
  if (fields)
  {
    objc_msgSend_engineeringValueOfType_value_(XRConstantEngineeringValue, v7, (uint64_t)v6, (uint64_t)fields, v8);
LABEL_3:
    v11 = (XRConstantEngineeringValue *)objc_claimAutoreleasedReturnValue();
    parsedValue = self->_parsedValue;
    self->_parsedValue = v11;

  }
  else
  {
    v17 = XREngineeringTypeIDForMnemonic(v6);
    if ((XR_ENGINEERING_ATTRIBUTES_BY_ETYPE[v17] & 0x10) != 0)
      objc_msgSend_reportProblemWithElement_failure_(self->super.super.context, v13, (uint64_t)self, (uint64_t)CFSTR("Structured engineering types are not supported"), v14);
    if ((_DWORD)v17)
    {
      switch(v17)
      {
        case 1:
        case 2:
        case 4:
        case 7:
        case 9:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 22:
        case 28:
        case 29:
        case 30:
        case 31:
        case 33:
        case 34:
        case 35:
        case 36:
        case 38:
        case 39:
        case 40:
        case 41:
        case 42:
        case 43:
        case 44:
        case 47:
        case 48:
        case 51:
        case 55:
        case 56:
        case 59:
        case 61:
        case 62:
        case 63:
        case 64:
        case 66:
        case 68:
        case 69:
        case 70:
        case 71:
        case 72:
        case 73:
        case 74:
        case 75:
        case 76:
        case 77:
        case 78:
        case 79:
        case 84:
        case 88:
        case 89:
        case 90:
        case 91:
        case 92:
        case 94:
        case 99:
        case 102:
        case 104:
        case 111:
        case 114:
        case 116:
        case 122:
        case 123:
        case 124:
        case 125:
        case 126:
        case 127:
        case 131:
        case 133:
        case 134:
        case 139:
        case 140:
        case 146:
        case 151:
        case 152:
        case 155:
        case 160:
        case 161:
        case 162:
        case 164:
        case 185:
        case 186:
        case 187:
        case 189:
        case 190:
        case 192:
        case 197:
        case 205:
        case 206:
        case 207:
        case 210:
        case 222:
        case 226:
        case 232:
        case 234:
        case 236:
        case 238:
        case 242:
        case 243:
        case 248:
          objc_msgSend_stringValue(self, v13, v15, v16, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = 0;
          if (objc_msgSend_xr_getLongLong_(v18, v19, (uint64_t)&v75, v20, v21))
          {
            objc_msgSend_numberWithLongLong_(MEMORY[0x24BDD16E0], v22, v75, v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_engineeringValueOfType_value_(XRConstantEngineeringValue, v26, (uint64_t)v9, (uint64_t)v25, v27);
            v28 = (XRConstantEngineeringValue *)objc_claimAutoreleasedReturnValue();
            v29 = self->_parsedValue;
            self->_parsedValue = v28;

          }
          goto LABEL_19;
        case 3:
        case 5:
        case 6:
        case 52:
        case 93:
        case 97:
        case 150:
        case 194:
        case 195:
        case 215:
        case 221:
        case 223:
        case 235:
          objc_msgSend_CLIPSLiteralFormatter(XREngineeringNumberFormatter, v13, v15, v16, v14);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringValue(self, v62, v63, v64, v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_numberFromString_(v61, v67, (uint64_t)v66, v68, v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_engineeringValueOfType_value_(XRConstantEngineeringValue, v71, (uint64_t)v9, (uint64_t)v70, v72);
          v73 = (XRConstantEngineeringValue *)objc_claimAutoreleasedReturnValue();
          v74 = self->_parsedValue;
          self->_parsedValue = v73;

          break;
        case 8:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
        case 65:
        case 95:
        case 96:
        case 103:
        case 130:
        case 135:
        case 143:
        case 147:
        case 159:
        case 163:
        case 193:
        case 209:
        case 225:
        case 233:
        case 237:
        case 245:
          objc_msgSend_stringValue(self, v13, v15, v16, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_alloc(MEMORY[0x24BDBCE50]);
          v37 = (void *)objc_msgSend_initWithBase64EncodedString_options_(v34, v35, (uint64_t)v18, 1, v36);
          if (v37)
          {
            v38 = (void *)objc_opt_new();
            v43 = objc_msgSend_length(v37, v39, v40, v41, v42);
            v44 = objc_retainAutorelease(v37);
            v49 = objc_msgSend_bytes(v44, v45, v46, v47, v48);
            if (v43)
            {
              v53 = v49;
              for (i = 0; i < v43; i += 8)
              {
                objc_msgSend_numberWithUnsignedLongLong_(MEMORY[0x24BDD16E0], v50, *(_QWORD *)(v53 + i), v51, v52);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v38, v56, (uint64_t)v55, v57, v58);

              }
            }
            objc_msgSend_engineeringValueOfType_value_(XRConstantEngineeringValue, v50, (uint64_t)v9, (uint64_t)v38, v52);
            v59 = (XRConstantEngineeringValue *)objc_claimAutoreleasedReturnValue();
            v60 = self->_parsedValue;
            self->_parsedValue = v59;

          }
          goto LABEL_19;
        case 10:
        case 11:
        case 12:
        case 20:
        case 21:
        case 32:
        case 37:
        case 45:
        case 49:
        case 50:
        case 53:
        case 54:
        case 57:
        case 58:
        case 60:
        case 67:
        case 80:
        case 81:
        case 82:
        case 83:
        case 85:
        case 86:
        case 87:
        case 98:
        case 100:
        case 101:
        case 105:
        case 106:
        case 108:
        case 109:
        case 110:
        case 112:
        case 113:
        case 115:
        case 117:
        case 118:
        case 119:
        case 120:
        case 121:
        case 128:
        case 129:
        case 132:
        case 136:
        case 137:
        case 138:
        case 141:
        case 144:
        case 145:
        case 148:
        case 149:
        case 153:
        case 154:
        case 156:
        case 165:
        case 166:
        case 167:
        case 168:
        case 169:
        case 170:
        case 171:
        case 172:
        case 173:
        case 174:
        case 175:
        case 176:
        case 177:
        case 178:
        case 179:
        case 180:
        case 182:
        case 183:
        case 184:
        case 188:
        case 191:
        case 196:
        case 199:
        case 200:
        case 201:
        case 202:
        case 203:
        case 204:
        case 211:
        case 212:
        case 213:
        case 214:
        case 217:
        case 218:
        case 219:
        case 220:
        case 224:
        case 227:
        case 228:
        case 229:
        case 230:
        case 231:
        case 239:
        case 240:
        case 241:
        case 244:
        case 246:
        case 247:
        case 249:
        case 250:
        case 251:
          objc_msgSend_collapsedStringValue(self, v13, v15, v16, v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            objc_msgSend_engineeringValueOfType_value_(XRConstantEngineeringValue, v30, (uint64_t)v9, (uint64_t)v18, v31);
            v32 = (XRConstantEngineeringValue *)objc_claimAutoreleasedReturnValue();
            v33 = self->_parsedValue;
            self->_parsedValue = v32;

          }
LABEL_19:

          break;
        case 46:
        case 107:
        case 142:
        case 157:
        case 158:
        case 181:
        case 198:
        case 208:
        case 216:
          objc_msgSend_engineeringValueOfType_value_(XRConstantEngineeringValue, v13, (uint64_t)v9, MEMORY[0x24BDBD1A8], v14);
          goto LABEL_3;
        default:
          break;
      }
    }
  }
  objc_msgSend_setValue_forElementName_(self->super.super.parent, v13, (uint64_t)self, (uint64_t)v9, v14);

}

- (XRConstantEngineeringValue)parsedValue
{
  return self->_parsedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsedValue, 0);
  objc_storeStrong((id *)&self->_fields, 0);
}

@end
