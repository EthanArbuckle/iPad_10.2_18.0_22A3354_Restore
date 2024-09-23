@implementation MDLMaterial(SCNModelIO)

+ (MDLMaterial)materialWithSCNMaterial:()SCNModelIO
{
  void *v5;
  MDLMaterial *v6;

  v5 = (void *)objc_opt_new();
  v6 = (MDLMaterial *)objc_msgSend([a1 alloc], "initWithName:scatteringFunction:", objc_msgSend(a3, "name"), v5);

  -[MDLMaterial setName:](v6, "setName:", objc_msgSend(a3, "name"));
  objc_setAssociatedObject(v6, CFSTR("SCNSceneKitAssociatedObject"), a3, (void *)0x301);
  objc_setAssociatedObject(a3, CFSTR("SCNSceneKitAssociatedObject"), v6, 0);
  setupMDLMaterialProperty(v6, CFSTR("emission"), (SCNMaterialProperty *)objc_msgSend(a3, "ambient"), MDLMaterialSemanticEmission);
  setupMDLMaterialProperty(v6, CFSTR("baseColor"), (SCNMaterialProperty *)objc_msgSend(a3, "diffuse"), MDLMaterialSemanticBaseColor);
  setupMDLMaterialProperty(v6, CFSTR("specular"), (SCNMaterialProperty *)objc_msgSend(a3, "specular"), MDLMaterialSemanticSpecular);
  setupMDLMaterialProperty(v6, CFSTR("reflective"), (SCNMaterialProperty *)objc_msgSend(a3, "reflective"), MDLMaterialSemanticUserDefined);
  setupMDLMaterialProperty(v6, CFSTR("opacity"), (SCNMaterialProperty *)objc_msgSend(a3, "transparent"), MDLMaterialSemanticOpacity);
  setupMDLMaterialProperty(v6, CFSTR("metallic"), (SCNMaterialProperty *)objc_msgSend(a3, "metalness"), MDLMaterialSemanticMetallic);
  setupMDLMaterialProperty(v6, CFSTR("roughness"), (SCNMaterialProperty *)objc_msgSend(a3, "roughness"), MDLMaterialSemanticRoughness);
  setupMDLMaterialProperty(v6, CFSTR("ambientOcclusion"), (SCNMaterialProperty *)objc_msgSend(a3, "ambientOcclusion"), MDLMaterialSemanticAmbientOcclusion);
  setupMDLMaterialProperty(v6, CFSTR("displacement"), (SCNMaterialProperty *)objc_msgSend(a3, "displacement"), MDLMaterialSemanticDisplacement);
  setupMDLMaterialProperty(v6, CFSTR("normal"), (SCNMaterialProperty *)objc_msgSend(a3, "normal"), MDLMaterialSemanticTangentSpaceNormal);
  if (objc_msgSend(a3, "isDoubleSided"))
    -[MDLMaterial setMaterialFace:](v6, "setMaterialFace:", 2);
  return v6;
}

@end
