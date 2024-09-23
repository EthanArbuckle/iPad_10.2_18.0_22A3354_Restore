@implementation GLPASTNode

uint64_t __deserialize_GLPASTNode_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, const char *);
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  _QWORD *v24;
  _QWORD v26[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned int *)(v2 + 260);
  if (v3 >= *(_DWORD *)(v2 + 256))
    goto LABEL_57;
  v4 = *(_QWORD *)(v2 + 248);
  v5 = *(char *)(v4 + v3);
  v6 = *(unsigned __int8 *)(v4 + v3);
  *(_DWORD *)(v2 + 260) = v3 + 1;
  if (v5 < 0)
    __asm { BR              X16 }
  v7 = glp_serialized_integer32_control(v6);
  v8 = *(_QWORD *)(a1 + 32);
  *(_DWORD *)(v8 + 260) += ~((((v7 >> 1) & 7) + 1) & ((char)v7 >> 7));
  v9 = *(uint64_t **)(v8 + 240);
  v10 = *v9;
  v11 = (uint64_t (*)(uint64_t, uint64_t, const char *))v9[1];
  v12 = glpBaseSizeOfNodeKind(v6);
  v13 = v11(v10, v12, "Deserialized");
  switch((int)v6)
  {
    case 0:
      deserializeTypeConversionFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 1:
      deserializeVariableIdentifierFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 2:
      deserializeTypeIdentifierFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 3:
      deserializeConstantFields(*(unsigned int **)(a1 + 32), v13);
      break;
    case 4:
    case 11:
    case 12:
    case 13:
    case 14:
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
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 48:
    case 51:
    case 52:
    case 54:
    case 65:
    case 67:
    case 68:
    case 69:
    case 72:
    case 73:
    case 74:
    case 77:
    case 82:
      v14.n128_f64[0] = deserializeASTFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 5:
      deserializeFieldAccessFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 6:
    case 10:
      deserializeCallFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 7:
      deserializeFunctionCallFields(*(unsigned int **)(a1 + 32), (_QWORD *)v13);
      break;
    case 8:
      deserializeSubroutineArrayCallFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 9:
      deserializeMethodCallFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 30:
      deserializeEqualFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 31:
      deserializeNotEqualFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 39:
      deserializeAssignFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 40:
      deserializeASTFields(*(_QWORD *)(a1 + 32), v13);
      abort();
    case 41:
      deserializeReadInputFields(*(unsigned int **)(a1 + 32), v13);
      break;
    case 42:
      deserializeWriteOutputFields(*(unsigned int **)(a1 + 32), v13);
      break;
    case 43:
      deserializeCommaExprFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 44:
      deserializeParameterDeclarationFields(*(unsigned int **)(a1 + 32), (_QWORD *)v13);
      break;
    case 45:
      deserializeFunctionPrototypeFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 46:
      deserializeVariableDeclarationFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 47:
      deserializeVariableDeclarationGroupFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 49:
      deserializeQualifiedDeclarationFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 50:
      deserializeQualifiedDeclarationGroupFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 53:
      deserializePrimitiveTypeFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 55:
      deserializeFieldDeclarationFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 56:
      deserializeStructTypeFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 57:
      deserializeInterfaceBlockFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 58:
      deserializeLayoutTypeFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 59:
      deserializeKeywordQualifierFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 60:
      deserializeLayoutQualifierFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 61:
      deserializeSubroutineTypeListFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 62:
      deserializeQualifierListFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 63:
      deserializeGlobalTypeQualifierFields(*(unsigned int **)(a1 + 32), v13);
      break;
    case 64:
      deserializeLayoutPairFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 66:
      deserializeBlockFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 70:
      deserializeCaseStatementFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 71:
      deserializeDefaultStatementFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 75:
      deserializeReturnStatementFields(*(unsigned int **)(a1 + 32), v13);
      break;
    case 76:
      deserializeTopLevelFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 78:
      deserializeRawCallFields(*(unsigned int **)(a1 + 32), (_QWORD *)v13);
      break;
    case 79:
      deserializeSubroutineRawCallFields(*(unsigned int **)(a1 + 32), v13);
      break;
    case 80:
      deserializeOffsetFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 81:
      deserializeLValueFields(*(_QWORD *)(a1 + 32), v13);
      break;
    case 83:
      deserializeIBPartialDerefFields(*(unsigned int **)(a1 + 32), v13);
      break;
    case 84:
      deserializePPStreamOpFields(*(_QWORD *)(a1 + 32), (_DWORD *)v13);
      break;
    case 85:
      deserializeSubroutineUniformFields(*(unsigned int **)(a1 + 32), v13);
      break;
    default:
      glpDeserialError(*(_QWORD *)(a1 + 32), 9u);
  }
  v2 = *(_QWORD *)(a1 + 32);
  v15 = *(unsigned int *)(v2 + 260);
  if (v15 >= *(_DWORD *)(v2 + 256))
LABEL_57:
    glpDeserialError(v2, 1u);
  v16 = *(_QWORD *)(v2 + 248);
  v17 = *(char *)(v16 + v15);
  v18 = *(unsigned __int8 *)(v16 + v15);
  *(_DWORD *)(v2 + 260) = v15 + 1;
  if (v17 < 0)
    __asm { BR              X16 }
  v19 = *(_QWORD *)(v2 + 240);
  *(_DWORD *)v13 = v18;
  *(_DWORD *)(v13 + 4) = 0;
  *(_QWORD *)(v13 + 8) = (*(uint64_t (**)(_QWORD, uint64_t, const char *, __n128))(v19 + 8))(*(_QWORD *)v19, 8 * v18, "Vector Storage (GLPASTNode *)", v14);
  if ((_DWORD)v18)
  {
    v20 = 0;
    v21 = 8 * v18;
    v22 = MEMORY[0x24BDAC760];
    do
    {
      *(_QWORD *)(*(_QWORD *)(v13 + 8) + 8 * (*(_DWORD *)(v13 + 4))++) = 3730710945;
      v23 = *(unsigned int **)(a1 + 32);
      v24 = (_QWORD *)(*(_QWORD *)(v13 + 8) + v20);
      v26[0] = v22;
      v26[1] = 0x40000000;
      v26[2] = __deserialize_GLPASTNode_block_invoke;
      v26[3] = &__block_descriptor_tmp_16_0;
      v26[4] = v23;
      deserialize_pointer(v23, (uint64_t)v26, v24);
      v20 += 8;
    }
    while (v21 != v20);
  }
  return v13;
}

@end
